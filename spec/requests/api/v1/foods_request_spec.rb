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
end