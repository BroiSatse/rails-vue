# frozen_string_literal: true

class Auth::Controllers::SessionsController < Devise::SessionsController
  include Auth::Controller
  include ::Controllers::Csrf

  wrap_parameters :auth
  respond_to :json

  def show
    render json: { current_user: current_user_json }
  end

  private

  def unverified_email
    Emails::Verify.pending_verification_for(owner: current_user, target: :email)
  end

  def current_user_json
    return unless current_user

    current_user.as_json.merge(unverified_email:)
  end
end
