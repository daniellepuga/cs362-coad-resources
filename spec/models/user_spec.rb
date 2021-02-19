require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new
  end

describe 'associations' do
    it { should belong_to(:organization).optional }
end

describe 'validations' do
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
  # format matcher here
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(7).is_at_most(255) }
end

  it 'has a role' do
    expect(user).to respond_to(:role)
  end

  it 'has an email' do
    expect(user).to respond_to(:email)
  end

end
