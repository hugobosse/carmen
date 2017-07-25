require 'rails_helper'

RSpec.describe User, '#mobile_phone_needed' do
  it "is not valid without a mobile phone number" do
    expect(User.new).to_not be_valid
  end

  it "is not valid if mobile phone is not a french mobile phone" do
    expect(User.new(mobile_phone: '0805060708')).to_not be_valid
  end

  it "is valid if mobile phone is a french mobile phone" do
    expect(User.new(mobile_phone: '0705060708')).to be_valid
  end
end