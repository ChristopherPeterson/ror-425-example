class Condiment < ActiveRecord::Base
  self.primary_key = 'survey_food_code'
  validates_presence_of :display_name, :calories

  has_many :needings
  has_many :foods, :through => :needings
end
