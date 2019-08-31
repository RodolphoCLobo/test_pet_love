class Pet < ApplicationRecord
  validates_presence_of :name, :monthly_cost
  validate :validate_birthday

  belongs_to :breed
  belongs_to :person

  def is_swallow?
    self.breed.name == 'Andorinha'
  end

  def validate_birthday
    if self.person && !self.person.is_adult? && is_swallow?
      errors.add(:person, "To have 'Andorinha' you must be over 18 years old")
    end
  end
end
