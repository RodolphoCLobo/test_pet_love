class Person < ApplicationRecord
  validates_presence_of :name, :document, :birthday

  has_many :pets
end
