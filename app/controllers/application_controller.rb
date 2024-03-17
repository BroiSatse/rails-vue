# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def show
    render html: '', layout: true
  end
end
