require 'rails_helper'

describe "Meals API" do
  it "sends a list of meals" do
    create_list(:meal, 3)

    get '/api/v1/meals'

    expect(response).to be_successful

    meals = JSON.parse(response.body)

    expect(meals.count).to eq(3)
  end
end