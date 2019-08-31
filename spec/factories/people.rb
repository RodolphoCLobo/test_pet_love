FactoryBot.define do
  factory :person do
    factory :adult do
      name { 'Kurt Cobain' }
      document { '555555555' }
      birthday { '20/02/1967'.to_date }
    end

    factory :child do
      name { 'Elvis Presley' }
      document { '555555555' }
      birthday { '17/08/2008'.to_date }
    end
  end
end
