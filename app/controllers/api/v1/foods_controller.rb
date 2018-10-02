class Api::V1::FoodsController < ApplicationController
    def index
        render json: Food.all
    end

    def show
        food = Food.find_by(id: params[:id])
        if food
            render json: food
        else
            render status: 404
        end
    end
end