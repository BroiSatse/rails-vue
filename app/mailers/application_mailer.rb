# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  prepend_view_path 'app/concepts/'

  EmailSenders = Struct.new(:default, keyword_init: true)
  SENDERS = EmailSenders.new(
    default: 'changeme@example.com'
  ).freeze

  def self.senders
    SENDERS
  end

  default from: senders.default
end
