require 'rails_helper'

RSpec.describe Request, type: :model do
  let!(:request) { create :request }

  it "is valid with valid attributes" do
    expect(request).to be_valid
  end

  it "should return request in past an hour" do
    expect(Request.in_past_an_hour_for(request.hunter).count).to eq(1)
    request.update_column(:created_at, request.created_at-1.hour)
    expect(Request.in_past_an_hour_for(request.hunter).count).to eq(0)
  end

  it "should return request in time between" do
    expect(Request.in_time_between(Time.now-1.hour, Time.now).count).to eq(1)
    expect(Request.in_time_between(Time.now-2.hour, Time.now-1.hour).count).to eq(0)
  end
end
