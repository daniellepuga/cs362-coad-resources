require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:valid_region) {Region.new(name: 'Fake region')}

  it 'exists' do
    Region.new
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

end