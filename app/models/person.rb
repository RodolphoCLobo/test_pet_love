class Person < ApplicationRecord
  validates_presence_of :name, :document, :birthday

  has_many :pets

  def is_adult?
    self.birthday < 18.year.ago
  end
end
