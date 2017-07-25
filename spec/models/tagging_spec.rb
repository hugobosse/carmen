require 'rails_helper'

RSpec.describe Tagging do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:restaurant)).to be_valid
  end
end
