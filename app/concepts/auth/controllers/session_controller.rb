# frozen_string_literal: true

class Auth::Controllers::SessionController < ApplicationController
  def show
    render json: { current_user: nil }
  end
end
