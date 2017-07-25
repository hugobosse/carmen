require 'rails_helper'

RSpec.describe Restaurant do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:restaurant)).to be_valid
  end

  describe '#service schedule' do
    it 'is invalid if it has a lunch starting time without ending time' do
      expect(FactoryGirl.build(:restaurant, lunch_service_starting_at: ))
    end
    it 'is invalid if it has a dinner starting time without ending time'
    it 'is invalid if it has a lunch ending time without starting time'
    it 'is invalid if it has a dinner ending time without starting time'
  end

end
