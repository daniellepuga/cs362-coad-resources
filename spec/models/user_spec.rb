require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new
  end

  it 'has a role' do
    expect(user).to respond_to(:role)
  end

  it 'has an organization' do
    expect(user).to respond_to(:organization)
  end

  it 'has an email' do
    expect(user).to respond_to(:email)
  end

  it 'has a password' do
    expect(user).to respond_to(:password)
  end

  it 'has a default role' do
    expect(user).to respond_to(:set_default_role)
  end

end
