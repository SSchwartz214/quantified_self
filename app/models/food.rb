class Food < ApplicationRecord
    validates_presence_of :name, :calories

    has_many :meal_foods
    has_many :meals, through: :meal_foods

    def self.favorites
        favorite_foods = select('foods.*, COUNT(meal_foods.id) AS times_eaten')
                        .joins(:meal_foods)
                        .group(:id)
                        .having('COUNT(meal_foods.id) > 1')
                        .order('times_eaten DESC')
       foods_hash = favorite_foods.group_by do |food|
            food.meal_foods.count
        end
        foods_hash.map do |times_eaten, food_object|
            FavoriteFood.new(times_eaten, food_object)
        end
    end
end
