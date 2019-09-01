class Person < ApplicationRecord
  has_many :pets

  validates_presence_of :name, :document, :birthday

  def is_adult?
    self.birthday <= 18.year.ago
  end

  def starts_with_a?
    self.name.downcase.start_with?('a')
  end
end
