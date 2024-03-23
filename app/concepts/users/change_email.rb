# frozen_string_literal: true

module Users
  class ChangeEmail < DomainProcess
    attribute :user, model: Models::User
    attribute :email
    attribute :confirmed, default: false

    validates :user, :email, presence: true
    validates :email, format: { with: Devise.email_regexp }, allow_blank: true

    def perform!
      if user.email == email
        clear_unconfirmed
        success!
      end

      check_email_taken!

      return Emails::Verify.(owner: user, target: :email, email:) unless confirmed

      clear_unconfirmed
      user.update_column(:email, email)
      notify_email_changed

      success!
    end

    private

    def clear_unconfirmed
      Emails::Verify::Clear.(owner: user, target: :email)
    end

    def notify_email_changed
      # TODO
    end

    def check_email_taken!
      existing = Models::User.where.not(id: user.id).where(email:).first
      failure! "Email already taken by User##{existing.id}" if existing
    end
  end
end
