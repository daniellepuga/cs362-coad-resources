require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do
    Ticket.new
  end

  describe 'associations' do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1020) }
    # it { should validate(:phone) }
    # it { should validate_length_of(:name) }
  end
  
  it 'has a name' do
    expect(ticket).to respond_to(:name)
  end

  it 'has a description' do
    expect(ticket).to respond_to(:description)
  end

  it 'has a phone' do
    expect(ticket).to respond_to(:phone)
  end

  it 'has a organization id' do
    expect(ticket).to respond_to(:organization_id)
  end

  it 'has a status' do
    expect(ticket).to respond_to(:open?)
  end

  it 'has a resource category' do
    expect(ticket).to respond_to(:resource_category)
  end
  
#   describe 'scopes' do 
#   describe 'closed' do
#     before do
#       open_ticket = Ticket.new(closed: false)
#       closed_ticket = Ticket.new(closed: true)
#       open_ticket.save
#       closed_ticket.save
#       result = Ticket.closed
#     end

#     it { expect(result).to include(closed_ticket) }
#     it { expect(result).to_not include(open_ticket) }
#   end
# end
end
