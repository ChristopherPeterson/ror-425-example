require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end

    it "loads all of the foods into @foods" do
      food = FactoryGirl.create(:food, food_code: 51208000, display_name: "100% whole wheat bagel", calories: 345.84000)
      food2 = FactoryGirl.create(:food, food_code: 51208001, display_name: "100% whole wheat bagel", calories: 345.84000)

      get :index
      expect(assigns(:foods)).to match_array([food, food2])
    end
  end
end
