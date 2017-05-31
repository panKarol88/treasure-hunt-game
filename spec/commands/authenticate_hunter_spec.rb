require 'rails_helper'

describe AuthenticateHunter do
  subject(:context) { described_class.call(email_address, password) }
  let!(:hunter) { create :hunter }

  describe '.call' do
    context 'when the context is successful' do
      let(:email_address) { 'test@test.pl' }
      let(:password) { 'test123' }

      it 'succeeds' do
        expect(context).to be_success
      end
    end

    context 'when the context is not successful' do
      let(:email_address) { 'wrong_email_address' }
      let(:password) { '' }

      it 'fails' do
        expect(context).to be_failure
      end
    end
  end
end
