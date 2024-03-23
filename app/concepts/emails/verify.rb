# frozen_string_literal: true

module Emails
  class Verify < DomainProcess
    attribute :owner
    attribute :target, default: :email
    attribute :email
    attribute :skip_email, default: false

    validates :owner, :target, :email, presence: true
    validates :email, format: { with: Devise.email_regexp }

    VALID_FOR = 2.days

    def self.pending_verification_for(owner:, target:)
      Models::EmailVerification.where(owner:, target:).last&.email
    end

    def perform!
      Models::EmailVerification.where(owner:, target:).where.not(email:).destroy_all
      success!(verified: true) if owner.send(target) == email

      verification = create_verification
      send_verification_email!(verification)
      success!(verified: false, verification_code: verification.code)
    end

    private

    def create_verification
      Models::EmailVerification.create!(
        owner:,
        target:,
        email:,
        code: Array.new(6) { rand(0..9) }.join,
        expires_at: VALID_FOR.from_now
      )
    end

    def send_verification_email!(verification)
      Mailer.verify(verification:, code: verification.code).deliver_now
    end
  end
end
