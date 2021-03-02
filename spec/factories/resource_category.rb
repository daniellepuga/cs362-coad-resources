FactoryBot.define do
  factory :resource_category do
    name { 'Fake' }
    trait :unspecified do
      name { 'Unspecified' }
    end
    trait :active do
      active { true }
    end
    trait :inactive do
      active { false }
    end
  end
end