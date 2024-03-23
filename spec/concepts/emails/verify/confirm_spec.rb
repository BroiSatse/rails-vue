# frozen_string_literal: true

RSpec.describe Emails::Verify::Confirm, type: :domain_process do
  subject(:result) { described_class.(owner:, code:) }

  let(:owner) { Users::Models::User.create!(email: previous_email) }
  let(:previous_email) { FFaker::Internet.email }
  let(:new_email) { FFaker::Internet.email }

  let(:codes) do
    Array.new(rand(2..3)) { verify!.payload[:verification_code] }
  end

  def verify!
    Emails::Verify.(owner:, target: :email, email: new_email)
  end

  context 'with correct code' do
    let(:code) { codes.sample }

    it { is_expected.to be_success }

    it "updates owner's target field" do
      expect { result }.to change { owner.reload.email }.from(previous_email).to(new_email)
    end

    it 'clears pending verification' do
      codes # ensure Emails::Verify calls are executed
      expect { result }
        .to change { Emails::Verify.pending_verification_for(owner:, target: :email) }
        .from(new_email)
        .to(nil)
    end
  end

  context 'with incorrect code' do
    let(:code) { 'XXX-XXX' }

    it { is_expected.to be_failure }

    it "does not update owner's target field" do
      expect { result }.not_to change { owner.reload.email }
    end

    it 'does not clear pending verification' do
      codes # ensure Emails::Verify calls are executed
      expect { result }.not_to change { Emails::Verify.pending_verification_for(owner:, target: :email) }
    end
  end

  context 'with expired code' do
    include ActiveSupport::Testing::TimeHelpers

    let!(:code) { travel_to((Emails::Verify::VALID_FOR + 1.minute).ago) { verify!.payload[:verification_code] } }

    it { is_expected.to be_failure }
  end
end
