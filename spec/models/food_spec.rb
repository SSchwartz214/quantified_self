require 'rails_helper'

RSpec.describe Food, type: :model do
  it "exists" do
    banana = create(:food)

    expect(banana).to be_a(Food)
  end

  it "has attributes" do
    banana = Food.create(name: "Banana", calories: 150)

    expect(banana.name).to eq("Banana")
    expect(banana.calories).to eq(150)
  end

  context "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end

  describe "Relationships" do
    it {should have_many :meal_foods}
    it {should have_many(:meals).through :meal_foods}
  end
end