require 'rails_helper'

describe GetStatistics do
  subject(:context) { described_class.call(analytic_params) }
  let!(:hunter) { create :hunter }
  let!(:treasure_with_requests) { FactoryGirl.create :treasure_with_requests }

  describe '.call' do
    context 'when the context is successful' do
      let(:analytic_params) { {start_time: Time.now-1.hour, end_time: Time.now, radius: "1000"} }
      it 'succeeds' do
        expect(context).to be_success
      end
    end

    context 'when the context is not successful' do
      let(:analytic_params) { {start_time: "", end_time: "", radius: ""} }

      it 'fails' do
        expect(context).to be_failure
      end
    end
  end
end
