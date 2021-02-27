FactoryBot.define do
  factory :region do
    name { 'Fake '}
    trait :unspecified do
      name { 'Unspecified' }
    end
  end
end