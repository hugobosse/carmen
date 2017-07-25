require 'rails_helper'

RSpec.describe Tagging, '#tag reference' do
  it "is invalid without a reference to a tag" do
    expect(Tagging.new).to_not be_valid
  end

  it "is invalid without a reference to a restaurant" do
    expect(Tagging.new())
  end
end
