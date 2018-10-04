FactoryBot.define do
  factory :meal do
    name { Faker::ChuckNorris.fact }
  end
end
