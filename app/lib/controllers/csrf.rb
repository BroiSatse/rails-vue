# frozen_string_literal: true

module Controllers::Csrf
  extend ActiveSupport::Concern

  included do
    after_action :set_csrf_token
  end

  private

  def set_csrf_token
    headers['x-csrf-token'] = form_authenticity_token
  end
end
