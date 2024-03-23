# frozen_string_literal: true

class ApiController < ActionController::API
  include Auth::Controller
  include ActionController::RequestForgeryProtection
  include Controllers::Csrf

  wrap_parameters false
end
