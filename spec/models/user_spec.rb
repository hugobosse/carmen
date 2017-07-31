require 'rails_helper'

RSpec.describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe '#mobile phone' do
    it "is invalid without a mobile phone number" do
      expect(User.new(password: 'abracadabra')).to_not be_valid
    end

    it "is invalid if mobile phone is not a french mobile phone" do
      expect(User.new(mobile_phone: '0805060708', password: 'blablabla')).to_not be_valid
    end

    it "is valid if mobile phone is a french mobile phone" do
      expect(User.new(mobile_phone: '0705060708', password: 'azerty')).to be_valid
    end

    it "is invalid if mobile phone is already taken" do
      first_user = FactoryGirl.create(:user)
      second_user = FactoryGirl.build(
        :user,
        mobile_phone: '+33611121314'
      )
      expect(second_user).to_not be_valid
    end
  end
end
