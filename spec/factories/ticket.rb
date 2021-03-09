FactoryBot.define do
  factory :ticket do
    name { 'Fake' }
    description { 'Fake Description' }
    phone { '+15414541232' }
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }
    # id {}
    trait :open do
      closed { false }
    end
    trait :closed do
      closed { true }
    end
  end
end