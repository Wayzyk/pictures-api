class V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    respond_to do |format|
      format.json { render json: @user.as_json }
    end
  end

  private

  def user_params
    params.permit(:email)
  end
end
