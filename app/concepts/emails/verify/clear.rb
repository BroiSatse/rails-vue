# frozen_string_literal: true

module Emails
  class Verify::Clear < DomainProcess
    attribute :owner
    attribute :target

    validates :owner, :target, presence: true

    def perform!
      Verify::Models::EmailVerification.where(owner:, target:).destroy_all
      success!
    end
  end
end
