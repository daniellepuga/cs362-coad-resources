require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket) }

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
  
  # Member functions
  describe 'scopes' do
    describe 'it has an open scope' do
      it 'should return open tickets' do
        open_ticket = create(:ticket, :open)
        expect(Ticket.open).to include open_ticket
      end
    end

    describe 'it returns closed tickets' do
      it 'should return closed tickets' do
        closed_ticket = create(:ticket, :closed)
        expect(Ticket.closed).to include closed_ticket
    end
  end
end
end
