class Needing < ActiveRecord::Base
  belongs_to :food
  belongs_to :condiment
end
