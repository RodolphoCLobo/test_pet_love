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
      context 'when person is not an adult.' do
        it "should return false." do
          person = build(:child)

          expect(person.is_adult?).to eq(false)
        end
      end

      context 'when person is an adult.' do
        it "should return true." do
          person = build(:adult)

          expect(person.is_adult?).to eq(true)
        end
      end
    end

    describe '#starts_with_a?' do
      context "when person name start with 'a'." do
        it "should return true." do
          person = build(:adult, { name: 'Axl Rose' })

          expect(person.starts_with_a?).to eq(true)
        end
      end

      context "when person name doesn't start with 'a'." do
        it "should return true." do
          person = build(:adult)

          expect(person.starts_with_a?).to eq(false)
        end
      end
    end

    describe '#total_monthly_cost' do
      context "when the person has a pet." do
        it "should return monthly cost." do
          person = create(:adult)
          create(:pet_1, { person: person, breed: create(:breed_1) })

          expect(person.total_monthly_cost).to eq(177.99)
        end
      end

      context "when the person has more than one pet." do
        it "should return the sum of monthly costs." do
          person = create(:adult)
          create(:pet_1, { person: person, breed: create(:breed_1) })
          create(:pet_2, { person: person, breed: create(:breed_2) })

          expect(person.total_monthly_cost).to eq(177.99 + 407.99)
        end
      end
    end
  end
end
