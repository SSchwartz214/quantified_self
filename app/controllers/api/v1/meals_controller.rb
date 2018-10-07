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

        MealFood.create(meal: meal, food: food)
        if meal && food
            render status: 201, json: {
                    message: "Successfully added #{food.name} to #{meal.name}"
            }.to_json   
        else
            render status: 404
        end 
    end

private 

    def meal_params
        params.require(:meal).permit(:name)
    end
end