# frozen_string_literal: true

class Auth::Controllers::SessionsController < Devise::SessionsController
  include Auth::Controller
  include ::Controllers::Csrf

  wrap_parameters :auth
  respond_to :json

  def show
    render json: { current_user: }
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
