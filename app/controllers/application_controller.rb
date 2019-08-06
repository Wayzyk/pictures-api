class ApplicationController < ActionController::API
  before_action :authenticate_user

  def current_user
    @current_user ||= User.find_by(token)
  end

  def token
    request["X-Authentication-Token"]
  end

  def authenticate_user
    if current_user.nil?
      render json: {}, status: 401
    end
  end
end
