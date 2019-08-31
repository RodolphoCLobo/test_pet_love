class Pet < ApplicationRecord
  validates_presence_of :name, :monthly_cost
  validate :validate_birthday, :validate_name

  belongs_to :breed
  belongs_to :person

  def is_swallow?
    self.breed.name == 'Andorinha'
  end

  def is_cat?
    self.breed.name == 'Gato'
  end

  def validate_birthday
    if self.person && !self.person.is_adult? && is_swallow?
      errors.add(:person, "To have 'Andorinha' you must be over 18 years old")
    end
  end

  def validate_name
    if self.person && self.person.starts_with_a? && is_cat?
      errors.add(:person, "To have a 'Gato' your name cannot start with 'a'")
    end
  end
end
