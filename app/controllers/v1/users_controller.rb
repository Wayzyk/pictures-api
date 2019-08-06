class V1::UsersController < ApiController
  def create
    begin
      @user = User.create!
      render_json data: { token: @user.auth_token }
    rescue Mongoid::Errors::MongoidError
      render_json data: { token: nil }
    end
  end
end
