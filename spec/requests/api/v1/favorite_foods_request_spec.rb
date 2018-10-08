require 'rails_helper'

describe "Favorite Foods API" do
    it "sends a list of the foods which were eaten most frequently" do
        
        breakfast = Meal.create(name: "breakfast")
        lunch = Meal.create(name: "lunch")
        dinner = Meal.create(name: "dinner")
        
        pancakes = Food.create(name: "pancakes", calories: 100)
        cereal = Food.create(name: "cereal", calories: 150)
        soup = Food.create(name: "soup", calories: 120)
        salad = Food.create(name: "salad", calories: 50)
        chicken = Food.create(name: "chicken", calories: 75)
        cheese = Food.create(name: "cheese", calories: 130)
        
        meal_food_1 = MealFood.create(meal_id: breakfast.id, food_id: pancakes.id)
        meal_food_2 = MealFood.create(meal_id: breakfast.id, food_id: pancakes.id)
        meal_food_3 = MealFood.create(meal_id: breakfast.id, food_id: cereal.id)
        meal_food_4 = MealFood.create(meal_id: lunch.id, food_id: salad.id)
        meal_food_5 = MealFood.create(meal_id: lunch.id, food_id: salad.id)
        meal_food_6 = MealFood.create(meal_id: lunch.id, food_id: salad.id)
        meal_food_7 = MealFood.create(meal_id: dinner.id, food_id: cheese.id)
        meal_food_8 = MealFood.create(meal_id: breakfast.id, food_id: chicken.id)
        meal_food_9 = MealFood.create(meal_id: dinner.id, food_id: chicken.id)
        meal_food_10 = MealFood.create(meal_id: dinner.id, food_id: chicken.id)
        
        get "/api/v1/favorite_foods"

        expect(response).to be_successful

        favorite_foods = JSON.parse(response.body)

        expect(favorite_foods.count).to eq(2)
    end
end