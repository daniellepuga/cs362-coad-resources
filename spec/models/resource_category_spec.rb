require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let (:resource_category) do
    ResourceCategory.new
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

