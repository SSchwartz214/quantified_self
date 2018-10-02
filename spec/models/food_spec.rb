require 'rails_helper'

RSpec.describe Food, type: :model do
  it "exists" do
    banana = create(:food)

    expect(banana).to be_a(Food)
  end

  it "has attributes" do
    banana = create(:food)

    expect(banana.name).to eq("Banana")
    expect(banana.calories).to eq(150)
  end
end