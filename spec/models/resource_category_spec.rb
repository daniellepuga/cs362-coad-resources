require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let (:resource_category) do
    ResourceCategory.new
  end

  describe 'associations' do
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:organizations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end

  
  it 'has a string for its name' do
    expect(ResourceCategory.new(name: 'Fake').to_s).to eq('Fake')
  end

  it 'has a name' do
    expect(resource_category).to respond_to(:name)
  end

  it 'has an active status' do
    expect(resource_category).to respond_to(:active)
  end

  it 'has many tickets' do
    expect(resource_category).to respond_to(:tickets)
  end

  it 'belongs to an organization' do
    expect(resource_category).to respond_to(:organizations)
  end

  # Member functions
  describe 'Region#unspecified' do
    it 'returns a region with the name Unspecified' do
      result = ResourceCategory.unspecified
      expect(result.name).to eq('Unspecified')
    end
  end

  it 'is inactive when its active attribute is false' do
    rc = ResourceCategory.new(active: false)
    expect(rc).to be_inactive
    rc.active = true
    expect(rc.inactive?).to be_falsy
  end

  it 'becomes active when activated' do
    rc = ResourceCategory.new(active: false)
    expect(rc).to be_inactive
    rc.activate
    expect(rc.active).to be_truthy
  end

  it 'becomes inactive when deactivated' do
    rc = ResourceCategory.new(active: true)
    expect(rc).to be_active
    rc.deactivate
    expect(rc.active).to be_falsy
  end

  describe 'active' do
    it 'includes active resource categories and not inactive ones' do
      active_rc = ResourceCategory.create(name: 'Active Category', active: true)
      inactive_rc = ResourceCategory.create(name: 'Inactive Category', active: false)
      results = ResourceCategory.active
      expect(results).to include(active_rc)
      expect(results).to_not include(inactive_rc)
    end
  end

  describe 'inactive' do
    it 'includes inactive resource categories and not active ones' do
      active_rc = ResourceCategory.create(name: 'Active Category', active: true)
      inactive_rc = ResourceCategory.create(name: 'Inactive Category', active: false)
      results = ResourceCategory.inactive
      expect(results).to include(inactive_rc)
      expect(results).to_not include(active_rc)
    end
  end
end

