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
end