require 'rails_helper'

RSpec.describe Meal, type: :model do
  it "exists" do
    meal = create(:meal)

    expect(meal).to be_a(Meal)
  end

  it "has attributes" do
    meal = create(:meal, name: "lunch")

    expect(meal.name).to eq("lunch")
  end

  describe "Relationships" do
    it {should have_many :meal_foods}
    it {should have_many(:foods).through :meal_foods}
  end
end
