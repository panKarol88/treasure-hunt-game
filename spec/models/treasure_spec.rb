require 'rails_helper'

RSpec.describe Treasure, type: :model do
  let(:treasure) { build :treasure }
  let(:treasure_with_requests) { FactoryGirl.create :treasure_with_requests }
  let(:treasure_found) { FactoryGirl.create :treasure_found }

  it "is valid with valid attributes" do
    expect(treasure).to be_valid
  end

  it "should have a working active scope" do
    treasure.save!
    expect(Treasure.active.count).to eq(1)
    treasure.update_attribute(:active, false)
    expect(Treasure.active.count).to eq(0)
  end

  it "should have a collection of requests" do
    expect(treasure_with_requests.requests.count).to eq(2)
  end

  it "founded treasure should be connected with lucky hunter" do
    expect(treasure_found.hunters.last == Hunter.last).to be_truthy
  end
end
