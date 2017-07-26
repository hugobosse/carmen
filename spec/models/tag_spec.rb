require 'rails_helper'

RSpec.describe Tag do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:tag)).to be_valid
  end

  describe '#name needed' do
    it 'is invalid without a name' do
      expect(FactoryGirl.build(:tag, name: nil)).to_not be_valid
    end
  end
end
