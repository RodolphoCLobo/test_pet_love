FactoryBot.define do
  factory :pet do
    factory :pet_1 do
      name { 'Dino' }
      monthly_cost { 177.99 }

      person
      breed
    end

    factory :pet_2 do
      name { 'Lassie' }
      monthly_cost { 407.99 }

      person
      breed
    end

    factory :pet_3 do
      name { 'Jaime' }
      monthly_cost { 600.00 }

      person
      breed
    end
  end
end
