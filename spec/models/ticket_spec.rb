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
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
  end

    #TODO: work on factory for scopes & phony
  # describe 'validators' do
  #   it 'must have a plausibly valid phone number' do
  #     ticket = Ticket.new(
  #       name: 'Fake',
  #       description: 'Fake',
  #       phone: '555-867-5309',
  #       region: Region.new(name: 'Fake'),
  #       resource_category: ResourceCategory.new(name: 'Fake')
  #     )
  #     expect(ticket).to be_valid
  #     ticket.phone = 'sup'
  #     expect(ticket).to_not be_valid
  #   end
  # end

  # describe 'scopes' do
  #   describe 'closed' do
  #     let(:closed_ticket) do
  #       create(:ticket, :closed)
  #     end
  #     it 'includes closed tickets' do
  #       open_ticket = create(:ticket, :open)
  #       expect(Ticket.closed).to include(closed_ticket)
  #     end
  #     it 'does not include non-closed tickets' do
  #       open_ticket = create(:ticket, :open)
  #       expect(Ticket.closed).to_not include(open_ticket)
  #     end
  #   end
  # end
  

  # it 'should have a valid phone number' do
  #   # Make this into a factory
  #   ticket.phone = '+41 44 111 22 33'
  #   ticket.name = 'ticket'
  #   ticket.description = 'this is a ticket'
  #   ticket.region = Region.create(name: "Fake region")
  #   ticket.organization = Organization.create(name: "Fake Organization", email: "fake@fake.com")
  #   ticket.resource_category = ResourceCategory.create(name: "Fake Resource Category")
  #   expect(ticket.valid?).to be_truthy
  #   ticket.phone = 'sup'
  #   expect(ticket).to_not be_valid
  # end

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

  it 'has a closed time' do
    expect(ticket).to respond_to(:closed_at)
  end

  it 'has a closed status' do
    expect(ticket).to respond_to(:closed)
  end
  
  # Member functions
    it 'detects status of ticket' do
      ticket.closed = false
      expect(ticket.open?).to be_truthy
      ticket.closed = true
      expect(ticket.open?).to be_falsy
    end

    it 'knows the tickets organizations' do
      expect(ticket.captured?).to be_falsy
      ticket.organization = Organization.new
      expect(ticket.captured?).to be_truthy
    end

    it 'should return a id as a string' do
      ticket.id = 123
      expect(ticket.to_s).to eq("Ticket #{ticket.id}")
    end
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
