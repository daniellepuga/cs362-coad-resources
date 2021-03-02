FactoryBot.define do
  factory :organization do
    name { 'Fake' }
    primary_name { 'Fake' }
    email { 'fake@fake.com' }
    phone { '+1 123 444 567' }
    secondary_name { 'Fake two' }
    secondary_phone { '+1 123 444 555' }
    trait :submitted do
      status { 'submitted' }
    end
    trait :approved do
      status { 'approved' }
    end
  end
end