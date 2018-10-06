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
end