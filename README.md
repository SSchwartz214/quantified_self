# README

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
   * Returns all foods currently in the database
   example: 
   {
    "id": 1,
    "name": "Banana",
    "calories": 150
    },
```
GET /api/v1/foods/:id
```
   * Returns the food object with the specific :id you’ve passed in
```
POST /api/v1/foods
```
   * Allows creating a new food with the parameters
```
PATCH /api/v1/foods/:id
```
  * Allows one to update an existing food with the parameters
```
DELETE /api/v1/foods/:id
```
  * Will delete the food with the id passed in

#### Meals
```
GET /api/v1/meals
```
   * Returns all the meals in the database along with their associated foods
```
GET /api/v1/meals/:meal_id/foods
```
   * Returns all the foods associated with the meal with an id specified by :meal_id
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
  * Retrieves data on the foods which were eaten most frequently.

#### Questions or comments?

Please contact me at:

* Seth: https://github.com/SSchwartz214
