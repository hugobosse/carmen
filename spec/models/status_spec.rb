require 'rails_helper'

RSpec.describe Status do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:status)).to be_valid
  end

  describe '#name' do
    it "is invalid without a name" do
      expect(FactoryGirl.build(:status, name: nil)).to_not be_valid
    end
  end
end
