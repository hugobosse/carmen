require 'rails_helper'

RSpec.describe Restaurant do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:restaurant)).to be_valid
  end

  describe '#service schedule' do
    it 'is invalid if lunch starting time is in invalid format (not HH:MM)' do
      expect(FactoryGirl.build(:restaurant, lunch_service_opening_at: 'abcd')).to_not be_valid
    end
    it 'is invalid if lunch ending time is in invalid format (not HH:MM)' do
      expect(FactoryGirl.build(:restaurant, lunch_service_closing_at: '78:69')).to_not be_valid
    end
    it 'is invalid if dinner starting time is in invalid format (not HH:MM)' do
      expect(FactoryGirl.build(:restaurant, dinner_service_opening_at: '9a;12')).to_not be_valid
    end
    it 'is invalid if dinner ending time is in invalid format (not HH:MM)' do
      expect(FactoryGirl.build(:restaurant, dinner_service_closing_at: '23:69')).to_not be_valid
    end
    it 'is invalid if it has a lunch starting time without ending time' do
      expect(FactoryGirl.build(
        :restaurant,
        lunch_service_opening_at: '12:00',
        lunch_service_closing_at: nil)
      ).to_not be_valid
    end
    it 'is invalid if it has a lunch ending time without starting time' do
      expect(FactoryGirl.build(
        :restaurant,
        lunch_service_opening_at: nil,
        lunch_service_closing_at: '15:00')
      ).to_not be_valid
    end
    it 'is invalid if it has a dinner starting time without ending time' do
      expect(FactoryGirl.build(
        :restaurant,
        dinner_service_opening_at: '19:00',
        dinner_service_closing_at: nil)
      ).to_not be_valid
    end
    it 'is invalid if it has a dinner ending time without starting time' do
      expect(FactoryGirl.build(
        :restaurant,
        dinner_service_opening_at: nil,
        dinner_service_closing_at: '23:00')
      ).to_not be_valid
    end
  end

  describe '#phone' do
    it 'is invalid without a primary_phone number' do
      expect(FactoryGirl.build(:restaurant, primary_phone: nil)).to_not be_valid
    end

    it 'is invalid if primary_phone format is not valid' do
      expect(FactoryGirl.build(:restaurant, primary_phone: '+33548')).to_not be_valid
    end
  end

end
