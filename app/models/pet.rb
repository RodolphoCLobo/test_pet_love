class Pet < ApplicationRecord
  validates_presence_of :name, :monthly_cost

  belongs_to :breed
  belongs_to :person
end
