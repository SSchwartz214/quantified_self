### Quantified Self

#### Description

Quantified Self is an app that allows users to track calories in meals that they eat.


#### Rails version: 5.1.6

### Configuration

* Clone the repository:
```
git clone https://github.com/SSchwartz214/quantified_self.git
```

* Setup:
```
$ bundle install
$ bundle update
$ rake db:{create,migrate,seed}
```

* To view locally:
```
$ rails s
visit 'localhost:3000' in your browser
```

* To view with Docker:
```
 in 'config/database.yml' uncomment lines 5-7
   $ docker-compose up
   $ docker-compose run web rake db:create
   $ docker-compose run web rake db:migrate
   $ docker-compose run web rake db:seed
```

* How to run the test suite
```
$ rspec
```

* To view production version, visit:
```
https://young-sea-78798.herokuapp.com/
```

### Record Endpoints:

#### Foods
```
GET /api/v1/foods
```
   * Returns all foods currently in the database<br/>
   example:<br/>
   {<br/>
    "id": 1,<br/>
    "name": "Banana",<br/>
    "calories": 150<br/>
    },<br/>
    {<br/>
    "id": 2,<br/>
    "name": "Chicken",<br/>
    "calories": 250<br/>
    },<br/>
```
GET /api/v1/foods/:id
```
   * Returns the food object with the specific :id you’ve passed in<br/>
   example:<br/>
   {<br/>
    "id": 1,<br/>
    "name": "Banana",<br/>
    "calories": 150<br/>
    }<br/>
```
POST /api/v1/foods
```
   * Allows creating a new food with the parameters<br/>
   example parameters:<br/>
   { "food": { "name": "Name of food here", "calories": "Calories here"} }<br/>
```
PATCH /api/v1/foods/:id
```
  * Allows one to update an existing food with the parameters<br/>
  example parameters:<br/>
  { "food": { "name": "Mint", "calories": "14"} }
```
DELETE /api/v1/foods/:id
```
  * Will delete the food with the id passed in

#### Meals
```
GET /api/v1/meals
```
   * Returns all the meals in the database along with their associated foodsexample:<br>
   example:<br/>
   [<br/>
    {<br/>
        "id": 1,<br/>
        "name": "Breakfast",<br/>
        "foods": [<br/>
            {<br/>
                "id": 1,<br/>
                "name": "Banana",<br/>
                "calories": 150<br/>
            },<br/>
            {<br/>
                "id": 6,<br/>
                "name": "Yogurt",<br/>
                "calories": 550<br/>
            },<br/>
            {<br/>
                "id": 12,<br/>
                "name": "Apple",<br/>
                "calories": 220<br/>
            }<br/>
        ]<br/>
    },<br/>
    {<br/>
        "id": 2,<br/>
        "name": "Snack",<br/>
        "foods": [<br/>
            {<br/>
                "id": 1,<br/>
                "name": "Banana",<br/>
                "calories": 150<br/>
            },<br/>
            {<br/>
                "id": 9,<br/>
                "name": "Gum",<br/>
                "calories": 50<br/>
            },<br/>
            {<br/>
                "id": 10,<br/>
                "name": "Cheese",<br/>
                "calories": 400<br/>
            }<br/>
        ]<br/>
    },<br/>
```
GET /api/v1/meals/:meal_id/foods
```
   * Returns all the foods associated with the meal with an id specified by :meal_id<br/>
   example:<br/>
   {<br/>
    "id": 1,<br/>
    "name": "Breakfast",<br/>
    "foods": [<br/>
        {<br/>
            "id": 1,<br/>
            "name": "Banana",<br/>
            "calories": 150<br/>
        },<br/>
        {<br/>
            "id": 6,<br/>
            "name": "Yogurt",<br/>
            "calories": 550<br/>
        },<br/>
        {<br/>
            "id": 12,<br/>
            "name": "Apple",<br/>
            "calories": 220<br/>
        }<br/>
    ]<br/>
}<br/>
```
POST /api/v1/meals/:meal_id/foods/:id
```
   * Adds the food with :id to the meal with :meal_id
```
DELETE /api/v1/meals/:meal_id/foods/:id
```
   * Removes the food with :id from the meal with :meal_id

#### Favorite Foods
```
GET /api/v1/favorite_foods
```
  * Retrieves data on the foods which were eaten most frequently.<br/>
  example:<br/>
  [<br/>
  {<br/>
    "timesEaten": 4,<br/>
    "foods":<br/>
      [<br/>
        {<br/>
          "name": "Banana",<br/>
          "calories": 200,<br/>
          "mealsWhenEaten": ["Breakfast", "Dinner"]<br/>
        },<br/>
  },

#### Questions or comments?

Please contact me at:

* Seth: https://github.com/SSchwartz214
