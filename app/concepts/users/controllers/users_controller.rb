module Users
  class Controllers::UsersController < ApiController
    wrap_parameters :user

    def update
      return render json: { success: false }, status: :unauthorized if params[:id] != current_user.id

      result = Update.(user_id: params[:id], **params[:attributes].to_unsafe_hash)

      if result.success?
        render json: { success: true }
      else
        render json: { success: false }, status: :unprocessable_entity
      end
    end
  end
end
