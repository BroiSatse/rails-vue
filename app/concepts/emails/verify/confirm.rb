# frozen_string_literal: true

module Emails
  class Verify::Confirm < DomainProcess
    attribute :owner
    attribute :code

    validates :owner, :code, presence: true

    def perform!
      failure!({ code: 'is invalid' }) unless matching_verification

      owner.update_column(matching_verification.target, matching_verification.email)
      Verify::Clear.(owner:, target: matching_verification.target)
      success!
    end

    private

    def matching_verification
      return @matching_verification if defined? @matching_verification

      @matching_verification = Verify::Models::EmailVerification
        .where(owner:)
        .where(expires_at: Time.zone.now..)
        .find_each.find { |ev| ev.authenticate_code(code) }
    end
  end
end
