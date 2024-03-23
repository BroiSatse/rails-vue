# frozen_string_literal: true

RSpec.describe Emails::Verify, type: :domain_process do
  subject(:result) { described_class.(owner:, target:, email:) }

  let(:target) { :email }
  let(:owner) { Users::Models::User.create!(email: previous_email) }
  let(:previous_email) { FFaker::Internet.email }
  let(:email) { [previous_email, FFaker::Internet.email].sample }

  context 'when new email is identical to previous email' do
    let(:email) { previous_email }

    it { is_expected.to be_success }
    it { is_expected.to have_payload(verified: true) }

    context 'with existing verification in progress' do
      let(:unconfirmed) { FFaker::Internet.email }

      before do
        described_class.(owner:, target:, email: unconfirmed)
      end

      it 'resets pending_verification' do
        expect { result }
          .to change { described_class.pending_verification_for(owner:, target:) }
          .from(unconfirmed)
          .to nil
      end
    end
  end

  context 'when new email is different than previous email' do
    let(:email) { FFaker::Internet.email }

    it { is_expected.to be_success }
    it { is_expected.to have_payload hash_including(verified: false, verification_code: instance_of(String)) }

    it 'generates 6-digit code' do
      expect(result.payload[:verification_code]).to match(/\A\d{6}\z/)
    end

    it "does not change owner's email address" do
      expect { result }.not_to change { owner.reload.email }
    end

    it 'sets pending_verification for given owner and target' do
      expect { result }
        .to change { described_class.pending_verification_for(owner:, target:) }
        .from(nil)
        .to email
    end
  end
end
