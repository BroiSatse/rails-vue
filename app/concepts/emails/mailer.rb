# frozen_string_literal: true

module Emails
  class Mailer < ApplicationMailer
    def verify(verification:, code:)
      @code = code
      mail(
        to: verification.email,
        subject: 'Confirm email address'
      )
    end
  end
end
