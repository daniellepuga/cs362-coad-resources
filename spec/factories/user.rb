FactoryBot.define do
  factory :user do
    role { 'organization' }
    email { 'fake@fake.com' }
    password { 'password' }
    trait :admin do
      role { 'admin' }
    end
  end
end