require 'rails_helper'

RSpec.describe User, '#mobile_phone_needed' do
  it "is not valid without a mobile phone number" do
    expect(User.new).to_not be_valid
  end
end
