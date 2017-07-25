require 'rails_helper'

RSpec.describe Budget do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:budget)).to be_valid
  end

  describe '#name' do
    it 'is invalid without a name' do
      expect(FactoryGirl.build(:budget, name: nil)).to_not be_valid
    end
  end
end
