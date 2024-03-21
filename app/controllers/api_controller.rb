# frozen_string_literal: true

class ApiController < ActionController::API
  include Auth::Controller

  wrap_parameters false
end
