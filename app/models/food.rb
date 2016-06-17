class Food < ActiveRecord::Base
  self.primary_key = 'food_code'
  validates_presence_of :display_name, :calories
end
