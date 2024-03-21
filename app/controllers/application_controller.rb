# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def show
    render html: '', layout: true
  end

  def not_found
    render json: { error: 'not_found' }, status: :not_found
  end
end
