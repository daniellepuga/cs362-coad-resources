require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) do
    Organization.new
  end

  it 'has an email' do
    expect(organization).to respond_to(:email)
  end

  it 'has a status' do
    expect(organization).to respond_to(:status)
  end

  it 'has an transportation boolean' do
    expect(organization).to respond_to(:transportation)
  end

  it 'has a name' do
    expect(organization).to respond_to(:name)
  end

  it 'has a phone' do
    expect(organization).to respond_to(:phone)
  end

  it 'has a primary_name' do
    expect(organization).to respond_to(:primary_name)
  end

  it 'has a secondary name' do
    expect(organization).to respond_to(:secondary_name)
  end

  it 'has a secondary phone' do
    expect(organization).to respond_to(:secondary_phone)
  end

  it 'has a description' do
    expect(organization).to respond_to(:description)
  end

end