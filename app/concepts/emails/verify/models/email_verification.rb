# frozen_string_literal: true

module Emails
  class Verify::Models::EmailVerification < ApplicationRecord
    self.table_name = 'email_verifications'

    belongs_to :owner, polymorphic: true
    has_secure_password :code, validations: false
  end
end
