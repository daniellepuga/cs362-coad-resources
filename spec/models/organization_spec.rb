require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { build(:organization) }

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
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    # it { should validate_format_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
  end
 # test 2 234
  describe 'status updates' do
    it 'has a default status' do
      organization.set_default_status
      expect(organization.status).to eq('submitted')
    end

    it 'can be approved' do
      organization.approve
      expect(organization.status).to eq('approved')
    end

    it 'can be rejected' do
      organization.reject
      expect(organization.status).to eq('rejected')
    end

    it 'does not change a confirmed status' do
      organization.approve
      organization.set_default_status
      expect(organization.status).to_not eq('submitted')
    end
  end

  it 'should return a string as a name' do
    expect(Organization.new(name: 'org').to_s).to eq('org')
  end
end