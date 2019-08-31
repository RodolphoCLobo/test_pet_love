require "rails_helper"

RSpec.describe Pet, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:monthly_cost).of_type(:float) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:monthly_cost) }
  it { is_expected.to belong_to(:breed) }
  it { is_expected.to belong_to(:person) }

  describe 'Instance Methods' do
    describe '#is_swallow?' do
      context 'when breed is an swallow' do
        it "should return true" do
          pet = build(:pet_1, { breed: build(:breed_3) })

          expect(pet.is_swallow?).to eq(true)
        end
      end

      context 'when breed not is an swallow' do
        it "should return false" do
          pet = build(:pet_1, { breed: build(:breed_1) })

          expect(pet.is_swallow?).to eq(false)
        end
      end
    end

    describe '#validate_birthday' do
      context 'when person is an adult.' do
        it "" do
          pet = build(:pet_1, person: create(:adult), breed: create(:breed_3) )
          pet.validate_birthday

          expect(pet.errors).to be_empty
        end
      end
      context 'when person not is an adult.' do
        it "" do
          pet = Pet.new(
            name: 'foo', monthly_cost: 100,
            person: create(:child), breed: create(:breed_3)
          )
          pet.validate_birthday

          expect(pet.errors.full_messages.first).to include('you must be over 18 years old')
        end
      end
    end
  end
end
