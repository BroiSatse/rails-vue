# frozen_string_literal: true

module Emails
  class Verify::Controllers::VerificationsController < ApiController
    OWNERS = {
      user: Users::Models::User
    }.freeze

    def create
      result = Verify::Confirm.(owner:, code: params[:code])

      if result.success?
        render json: { success: true }
      else
        render json: { success: false, errors: result.errors }, status: :unprocessable_entity
      end
    end

    private

    def owner
      @owner ||= begin
        type, id = params[:owner].split('#', 2)
        OWNERS[type.to_sym].find(id)
      end
    end
  end
end
