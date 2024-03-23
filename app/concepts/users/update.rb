# frozen_string_literal: true

module Users
  class Update < DomainProcess
    attribute :user, model: Models::User
    BLANK = Object.new
    MODEL_ATTRS = %i[display_name].freeze

    attribute :display_name, default: BLANK

    def perform!
      user.assign_attributes(model_attributes)
      user.registered_at ||= Time.zone.now
      changes = user.changes
      user.save!
      success(changes:)
    end

    private

    def model_attributes
      @model_attributes ||= MODEL_ATTRS.map do |attr|
        value = send(attr)
        [attr, value] unless value == BLANK
      end.compact.to_h
    end
  end
end
