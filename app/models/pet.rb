class Pet < ApplicationRecord
  belongs_to :breed
  belongs_to :person

  validates_presence_of :name, :monthly_cost
  validate :validate_birthday, :validate_name, :validate_monthly_cost

  MAX_MONTHLY_COST = 1000

  def is_swallow?
    self.breed.name == 'Andorinha'
  end

  def is_cat?
    self.breed.name == 'Gato'
  end

  def validate_birthday
    if self.person && !self.person.is_adult? && is_swallow?
      errors.add(:person, "To have '#{self.breed.name}' you must be over 18 years old")
    end
  end

  def validate_name
    if self.person && self.person.starts_with_a? && is_cat?
      errors.add(:person, "To have a '#{self.breed.name}' your name cannot start with 'a'")
    end
  end

  def validate_monthly_cost
    if self.person && (self.person.pets.sum(:monthly_cost) + self.monthly_cost) > MAX_MONTHLY_COST
      errors.add(:person, "Your monthly cost cannot be greater than #{MAX_MONTHLY_COST}")
    end
  end
end
