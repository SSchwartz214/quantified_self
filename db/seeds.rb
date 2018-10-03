10.times do
    Food.create(
        name: Faker::Food.dish,
        calories: Faker::Number.between(1, 1000)
    )
end