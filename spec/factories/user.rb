FactoryBot.define do
  factory :user do
    role { 'organization' }
    email { 'fake@fake.com' }
    password { 'password' }
    password_confirmation { 'password' }
    
    trait :organization do
      organization
      role { 'organization' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end