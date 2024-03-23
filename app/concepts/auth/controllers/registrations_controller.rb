# frozen_string_literal: true

class Auth::Controllers::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  wrap_parameters :auth, only: :create

  include Auth::Controller
  include ::Controllers::Csrf

  def check
    render json: { taken: Auth::Models::Auth.exists?(email: params[:email]) }
  end

  def create
    ApplicationRecord.transaction do
      super
      Users::ChangeEmail.(user: resource.user, email: resource.email)
    end
  end

  private

  def build_resource(hash = nil)
    super.tap { |auth| auth.user || auth.build_user }
  end
end
