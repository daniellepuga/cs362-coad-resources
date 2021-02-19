require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) do
    Organization.new
  end

  describe 'associations' do
      it { should have_many(:users) }
      it { should have_many(:tickets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email).on(:create) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    # it { should validate_format_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { should validate_length_of(:description).is_at_most(1020) }
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_one)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_two)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_three)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_four)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_five)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_six)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_seven)
  end

  it 'has an agreement' do
    expect(organization).to respond_to(:agreement_eight)
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