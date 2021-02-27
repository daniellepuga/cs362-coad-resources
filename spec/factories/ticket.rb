FactoryBot.define do
  factory :ticket do
    name { 'Fake' }
    description { 'Fake Description' }
    phone { '555-123-1234' }
    region { create(:region).id }
    resource_category { create(:resource_category).id }

    trait :open do
      closed { false }
    end

    trait :closed do
      closed { true }
    end

  end
end