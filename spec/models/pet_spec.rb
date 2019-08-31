require "rails_helper"

RSpec.describe Pet, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:monthly_cost).of_type(:float) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:monthly_cost) }
  it { is_expected.to belong_to(:breed) }
  it { is_expected.to belong_to(:person) }
end
