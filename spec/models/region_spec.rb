require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:valid_region) {Region.new(name: 'Fake region')}

  it { should have_many(:tickets) }

  it 'has a name' do 
    region = Region.new
    expect(region).to respond_to(:name)
  end

  it 'is not valid without a name' do
    region = Region.new(name: 'Fake region')
    expect(region).to be_valid
    region.name = nil
    expect(region).to_not be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end