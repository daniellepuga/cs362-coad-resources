require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

describe 'associations' do
    it { should belong_to(:organization).optional }
end

describe 'validations' do
  it { should validate_presence_of(:email) }
  it { should respond_to(:role) }
  it { should respond_to(:email) }
  it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
  # format matcher here
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_presence_of(:password).on(:create) }
  it { should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create) }
end

  # Member functions
  describe 'set default role' do
    it 'has no role' do
      user.role = nil
      expect(user.role).to eq(nil)
    end

    it 'should give a default role to new users' do
      user.set_default_role
      expect(user.role).to eq('organization')
    end

    it 'should not update the users existing role' do
      user.role = 'admin'
      user.set_default_role
      expect(user.role).to eq('admin')
    end
  end

  it 'should return a string as a email' do
    expect(User.new(email: 'fake@fakest.com').to_s).to eq('fake@fakest.com')
  end
end 