require 'rails_helper'

RSpec.describe Treasure, type: :model do
  let(:treasure) { build :treasure }

  it "is valid with valid attributes" do
    expect(treasure).to be_valid
  end
end
