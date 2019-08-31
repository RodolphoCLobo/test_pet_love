require "rails_helper"

RSpec.describe Person, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:document).of_type(:string) }
  it { is_expected.to have_db_column(:birthday).of_type(:datetime) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_presence_of(:birthday) }
  it { is_expected.to have_many(:pets) }

  describe 'Instance Methods' do
    describe '#is_adult?' do
      context 'when person is not an adult' do
        it "should return false" do
          person = build(:child)

          expect(person.is_adult?).to eq(false)
        end
      end

      context 'when person is an adult' do
        it "should return true" do
          person = build(:adult)

          expect(person.is_adult?).to eq(true)
        end
      end
    end
  end
end
