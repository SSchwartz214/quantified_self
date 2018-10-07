class Api::V1::MealsController < ApplicationController
    def index
        render json: Meal.all
    end

    def show
        meal = Meal.find_by(id: params[:meal_id])
        if meal
            render json: meal 
        else
            render status: 404
        end
    end

    def create 
        meal = Meal.find_by(id: params[:meal_id])
        food = Food.find_by(id: params[:id])

        if meal && food
            MealFood.create(meal: meal, food: food)
            render status: 201, json: {
                message: "Successfully added #{food.name} to #{meal.name}"
            }  
        else
            render status: 404
        end 
    end

    def destroy
        meal = Meal.find_by(id: params[:meal_id])
        food = Food.find_by(id: params[:id])
        
        if meal && food && MealFood.find_by(meal_id: meal.id, food_id: food.id)
            meal_food = MealFood.where(meal_id: meal.id, food_id: food.id)
            meal_food.destroy_all
            render json: {
                message: "Successfully removed #{food.name} from #{meal.name}"
            }
        else
            render status: 404
        end
    end
end