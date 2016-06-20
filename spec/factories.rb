# Factories for testing this application

FactoryGirl.define do

  # Food model Factory
  factory :food do
    food_code 51208000
    display_name "100% whole wheat bagel"
    calories 345.84000
  end

  # Condiment model Factory
  factory :condiment do
    food_code 12350000
    display_name "Sour cream dip"
    calories 133.65000

    factory :food_condiment do
      food_code 12350000
      display_name "Sour cream dip"
      calories 133.65000
      food
    end
  end

end