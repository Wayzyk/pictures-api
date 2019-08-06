class ApplicationController < ActionController::API
  def current_user
    User.find_by(token)
  end

  def token
    request["X-Authentication-Token"]
  end
end
