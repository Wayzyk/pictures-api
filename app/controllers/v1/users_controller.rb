class V1::UsersController < ApplicationController
  include ActionController::MimeResponds
  skip_before_action :authenticate_user, :only => [:create]

  def create
    @user = User.create(user_params)
    respond_to do |format|
      format.json { render json: @user.as_json }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :picture)
  end
end
