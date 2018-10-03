FactoryBot.define do
  factory :food do
    name { Faker::FamilyGuy.quote }
    calories { Faker::Number.between(1, 1000) }
  end
end
