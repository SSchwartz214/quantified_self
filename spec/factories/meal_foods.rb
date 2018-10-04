FactoryBot.define do
  factory :meal_food do
    meal { create(:meal) }
    food { create(:food) }
  end
end
