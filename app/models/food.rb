class Food < ActiveRecord::Base
  self.primary_key = 'food_code'
  validates_presence_of :display_name, :calories

  has_many :needings
  has_many :condiments, :through => :needings
end
