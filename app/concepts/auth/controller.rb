module Auth::Controller
  def authenticate_user!
    authenticate_auth!
  end

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = current_auth&.user || current_auth&.build_user
  end
end
