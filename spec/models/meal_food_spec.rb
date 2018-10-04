require 'rails_helper'

RSpec.describe MealFood, type: :model do
  describe "Relationships" do
    it {should belong_to :meal}
    it {should belong_to :food}
  end
end
