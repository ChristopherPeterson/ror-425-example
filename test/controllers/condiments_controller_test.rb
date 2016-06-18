require 'test_helper'

class CondimentsControllerTest < ActionController::TestCase
  setup do
    @condiment = condiments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:condiments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condiment" do
    assert_difference('Condiment.count') do
      post :create, condiment: { added_sugars: @condiment.added_sugars, alcohol: @condiment.alcohol, calories: @condiment.calories, display_name: @condiment.display_name, dkgreen: @condiment.dkgreen, drybeans_peas: @condiment.drybeans_peas, fruits: @condiment.fruits, grains: @condiment.grains, meat: @condiment.meat, milk: @condiment.milk, oils: @condiment.oils, orange: @condiment.orange, other_vegetables: @condiment.other_vegetables, portion_code: @condiment.portion_code, portion_size: @condiment.portion_size, saturated_fats: @condiment.saturated_fats, solid_fats: @condiment.solid_fats, soy: @condiment.soy, starchy_vegetables: @condiment.starchy_vegetables, survey_food_code: @condiment.survey_food_code, vegetables: @condiment.vegetables, whole_grains: @condiment.whole_grains }
    end

    assert_redirected_to condiment_path(assigns(:condiment))
  end

  test "should show condiment" do
    get :show, id: @condiment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condiment
    assert_response :success
  end

  test "should update condiment" do
    patch :update, id: @condiment, condiment: { added_sugars: @condiment.added_sugars, alcohol: @condiment.alcohol, calories: @condiment.calories, display_name: @condiment.display_name, dkgreen: @condiment.dkgreen, drybeans_peas: @condiment.drybeans_peas, fruits: @condiment.fruits, grains: @condiment.grains, meat: @condiment.meat, milk: @condiment.milk, oils: @condiment.oils, orange: @condiment.orange, other_vegetables: @condiment.other_vegetables, portion_code: @condiment.portion_code, portion_size: @condiment.portion_size, saturated_fats: @condiment.saturated_fats, solid_fats: @condiment.solid_fats, soy: @condiment.soy, starchy_vegetables: @condiment.starchy_vegetables, survey_food_code: @condiment.survey_food_code, vegetables: @condiment.vegetables, whole_grains: @condiment.whole_grains }
    assert_redirected_to condiment_path(assigns(:condiment))
  end

  test "should destroy condiment" do
    assert_difference('Condiment.count', -1) do
      delete :destroy, id: @condiment
    end

    assert_redirected_to condiments_path
  end
end
