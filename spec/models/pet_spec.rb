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
      context 'when breed is an swallow.' do
        it "should return true." do
          pet = build(:pet_1, { breed: build(:breed_3) })

          expect(pet.is_swallow?).to eq(true)
        end
      end

      context 'when breed not is an swallow.' do
        it "should return false." do
          pet = build(:pet_1, { breed: build(:breed_1) })

          expect(pet.is_swallow?).to eq(false)
        end
      end
    end

    describe '#is_cat?' do
      context 'when breed is an cat.' do
        it "should return true." do
          pet = build(:pet_1, { breed: build(:breed_4) })

          expect(pet.is_cat?).to eq(true)
        end
      end

      context 'when breed not is an cat.' do
        it "should return false." do
          pet = build(:pet_1, { breed: build(:breed_1) })

          expect(pet.is_cat?).to eq(false)
        end
      end
    end

    describe '#validate_birthday' do
      context 'when person is an adult.' do
        it "should may have swallow." do
          pet = build(:pet_1, person: create(:adult), breed: create(:breed_3) )
          pet.validate_birthday

          expect(pet.errors).to be_empty
        end
      end

      context 'when person not is an adult.' do
        it "should can't have swallow." do
          pet = Pet.new(
            name: 'foo', monthly_cost: 100,
            person: create(:child), breed: create(:breed_3)
          )
          pet.validate_birthday

          expect(pet.errors.full_messages.first).to include('you must be over 18 years old')
        end
      end
    end

    describe '#validate_name' do
      context "when person name doesn't start with 'a'." do
        it "should may have cat." do
          pet = build(:pet_1, person: create(:adult), breed: create(:breed_4))
          pet.validate_name

          expect(pet.errors).to be_empty
        end
      end

      context "when person name start with 'a'." do
        it "should can't have cat." do
          pet = Pet.new(
            name: 'foo', monthly_cost: 100,
            person: create(:adult, { name: 'Axl Rose' }),
            breed: create(:breed_4)
          )
          pet.validate_name

          expect(pet.errors.full_messages.first).to include("your name cannot start with 'a'")
        end
      end
    end

    describe '#validate_monthly_cost' do
      context "when the monthly cost is not greater than 1000." do
        it "should may have more than one pet." do
          person = create(:adult)
          breed = create(:breed_1)
          create(:pet_1, { person: person, breed: breed })
          pet = build(:pet_2, { person: person, breed: breed })
          pet.validate_monthly_cost

          expect(pet.errors).to be_empty
        end
      end

      context "when the monthly cost is greater than 1000." do
        it "should can't have one more pet." do
          person = create(:adult)
          breed = create(:breed_1)
          create(:pet_2, { person: person, breed: breed })
          pet = Pet.new(name: 'foo', monthly_cost: 600.00, person: person, breed: breed)
          pet.validate_monthly_cost

          expect(pet.errors.full_messages.first).to include("cannot be greater than 1000")
        end
      end
    end
  end
end
