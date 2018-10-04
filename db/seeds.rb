breakfast = Meal.create(name: "breakfast")
breakfast.foods.create(name: "pancakes", calories: 100)
breakfast.foods.create(name: "cereal", calories: 150)

lunch = Meal.create(name: "lunch")
lunch.foods.create(name: "salad", calories: 50)
lunch.foods.create(name: "chicken", calories: 75)

dinner = Meal.create(name: "dinner")
dinner.foods.create(name: "soup", calories: 120)
dinner.foods.create(name: "cheese", calories: 130)


