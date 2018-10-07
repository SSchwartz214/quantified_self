require 'rails_helper'

describe "Meals API" do
  before :each do 
    breakfast = create(:meal)
    breakfast.foods.create(name: "pancakes", calories: 100)
    breakfast.foods.create(name: "cereal", calories: 150)

    lunch = create(:meal)
    lunch.foods.create(name: "salad", calories: 50)
    lunch.foods.create(name: "chicken", calories: 75)

    dinner = create(:meal)
    dinner.foods.create(name: "soup", calories: 120)
    dinner.foods.create(name: "cheese", calories: 130)
  end
    
  it "sends a list of meals" do

    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body)

    expect(meals.count).to eq(3)
  end

  it 'can get one meal by its id' do
    id = Meal.first.id

    get "/api/v1/meals/#{id}/foods"

    meal = JSON.parse(response.body)

    expect(response).to be_successful
    expect(meal["id"]).to eq(id)
  end

  it "returns a 404 if the food does not exist" do

    get "/api/v1/meals/4/foods"

    expect(response.status).to eq(404)
  end

  it "Adds the food with :id to the meal with :meal_id" do
    count = MealFood.count
    meal_id = Meal.first.id
    meal_name = Meal.first.name
    id = Food.last.id
    food_name = Food.last.name

    post "/api/v1/meals/#{meal_id}/foods/#{id}"

    assert_response :success
  
    expect(MealFood.count).to eq(count + 1)
    expect(MealFood.last.food_id).to eq(id)
    expect(MealFood.last.meal_id).to eq(meal_id)
    expect(response.status).to eq(201)
    expect(JSON.parse(response.body)["message"]).to eq("Successfully added #{food_name} to #{meal_name}")
  end

end