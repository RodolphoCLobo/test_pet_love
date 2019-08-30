class Person < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :document
  validates_presence_of :birthday
end
