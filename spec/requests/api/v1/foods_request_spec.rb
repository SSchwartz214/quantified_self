require 'rails_helper'

describe "Foods API" do
  before :each do
    create_list(:food, 3)
  end

  it "sends a list of Foods" do

    get '/api/v1/foods'

    expect(response).to be_successful

    foods = JSON.parse(body)

    expect(foods.count).to eq(3)
  end

  it "can get one food by its id" do
    id = Food.first.id

    get "/api/v1/foods/#{id}"

    food = JSON.parse(body)

    expect(response).to be_successful
    expect(food["id"]).to eq(id)
  end

  it "returns a 404 if the food does not exist" do

    get "/api/v1/foods/4"

    expect(response.status).to eq(404)
  end

  it "can create a new food" do
    food_params = { name: "carrot", calories: 100}

    post "/api/v1/foods", params: {food: food_params}
    food = Food.last

    assert_response :success
    expect(response).to be_successful
    expect(food.name).to eq(food_params[:name])
  end

  it "returns a 400 if the food is not successfully created" do
    food_params = { name: "carrot" }

    post "/api/v1/foods", params: {food: food_params}

    expect(response.status).to eq(400)
  end

  it "can update an existing food" do
    id = Food.last.id
    previous_name = Food.last.name
    food_params = { name: "cheese", calories: 150 }
    patch "/api/v1/foods/#{id}", params: {food: food_params}
    food = Food.find_by(id: id)

    expect(response).to be_successful
    expect(food.name).to_not eq(previous_name)
    expect(food.name).to eq("cheese")
  end

  it "returns a 400 if the food is not successfully updated" do
    id = Food.last.id
    previous_name = Food.last.name
    food_params = { color: "green" }
    patch "/api/v1/foods/#{id}", params: {food: food_params}
    food = Food.find_by(id: id)

    expect(response.status).to eq(400)
  end

  it "can destroy a food" do
    food = Food.last

    expect(Food.count).to eq(3)
  
    delete "/api/v1/foods/#{food.id}"
  
    expect(response.status).to eq(204)
    expect(Food.count).to eq(2)
    expect{Food.find(food.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "returns a 400 if the food can't be found to destroy" do

    expect(Food.count).to eq(3)
  
    delete "/api/v1/foods/4"
  
    expect(response.status).to eq(400)
  end
end