FactoryBot.define do
  factory :user do
    role { 'organization' }
    sequence(:email) { |n| "fake#{n}@fake.com"}
    password { 'password' }
    password_confirmation { 'password' }
    
    trait :organization do
      organization { build(:organization, :approved) }
      role { 'organization' }
    end

    trait :admin do
      role { 'admin' }
    end
    
    after :create do |user|
      user.confirm
    end
  end
end