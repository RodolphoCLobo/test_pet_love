class Pet < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :monthly_cost
end
