require "rails_helper"

RSpec.describe Person, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:document).of_type(:string) }
  it { is_expected.to have_db_column(:birthday).of_type(:datetime) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_presence_of(:birthday) }
  it { is_expected.to have_many(:pets) }
end
