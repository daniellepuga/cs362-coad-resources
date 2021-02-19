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
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
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
  # ask about how to check different statuses
  
  # it 'has an inactive status' do
  #   expect(resource_category).to respond_to(:inactive)
  # end

end

