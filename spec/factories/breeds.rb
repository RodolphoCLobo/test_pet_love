FactoryBot.define do
  factory :breed do
    factory :breed_1 do
      name { 'Iguana' }
    end

    factory :breed_2 do
      name { 'Ornitorrinco' }
    end

    factory :breed_3 do
      name { 'Andorinha' }
    end
  end
end
