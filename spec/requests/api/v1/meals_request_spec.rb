require 'rails_helper'

describe "Meals API" do
  it "sends a list of meals" do
    breakfast = create(:meal)
    breakfast.foods.create(name: "pancakes", calories: 100)
    breakfast.foods.create(name: "cereal", calories: 150)

    lunch = create(:meal)
    lunch.foods.create(name: "salad", calories: 50)
    lunch.foods.create(name: "chicken", calories: 75)

    dinner = create(:meal)
    dinner.foods.create(name: "soup", calories: 120)
    dinner.foods.create(name: "cheese", calories: 130)


    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body)

    expect(meals.count).to eq(3)
  end
end