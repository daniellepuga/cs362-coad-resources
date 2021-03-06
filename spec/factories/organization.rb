FactoryBot.define do
  factory :organization do
    sequence (:name) { |n| "organization #{n}" }
    sequence (:email) { |n| "fake#{n}@fake.com" }
    phone { '+1 123 444 567' }
    primary_name { 'Fake' }
    secondary_name { 'Fake two' }
    description { 'fake' }
    liability_insurance { true }
    title { 'fake title' }
    transportation { :yes }
    secondary_phone { '+1 123 444 555' }

    trait :submitted do
      status { 'submitted' }
    end

    trait :approved do
      status { 'approved' }
    end
  end
end