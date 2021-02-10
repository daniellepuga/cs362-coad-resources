require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do
    Ticket.new
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

  it 'has a region' do
    expect(ticket).to respond_to(:region)
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
