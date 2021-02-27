require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:valid_region) {Region.new(name: 'Fake region')}

  describe 'assocations' do
    it { should have_many(:tickets) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_uniqueness_of(:name).
      case_insensitive }
  end

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

  it 'should return a string as a name' do
    expect(Region.new(name: 'Fake').to_s).to eq('Fake')
  end

  describe 'Region#unspecified' do
    it 'returns a region with the name Unspecified' do
      result = Region.unspecified
      expect(result.name).to eq('Unspecified')
    end
  end
end