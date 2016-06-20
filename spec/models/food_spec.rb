require 'rails_helper'

RSpec.describe Food, type: :model do
  #integrate_views
  it "should allow creation of multiple food entries (validated by retrieving items ordered by ID)" do
    food = FactoryGirl.create(:food, food_code: 51208000, display_name: "100% whole wheat bagel", calories: 345.84000)
    food2 = FactoryGirl.create(:food, food_code: 51208001, display_name: "100% whole wheat bagel", calories: 345.84000)

    expect(Food.order(:food_code)).to eq([food, food2])
  end

  it "should allow a food to have 1 or more condiments"

end
