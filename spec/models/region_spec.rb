require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { build(:region) }

  describe 'assocations' do
    it { should have_many(:tickets) }
    it { should respond_to(:name) } 
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).case_insensitive }
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
    it 'creates an unspecified region' do
      expect(Region.where(name: "Unspecified")).to be_empty
      unspec_region = Region.unspecified
      expect(Region.where(name: "Unspecified")).to include unspec_region
    end
    it 'returns a region with the name Unspecified' do
      unspec_region = create(:region, :unspecified)
      expect(Region.where(name: "Unspecified")).to include unspec_region
    end
  end
end