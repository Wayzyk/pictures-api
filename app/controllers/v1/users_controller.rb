# frozen_string_literal: true

module V1
  class UsersController < ApiController

    swagger_controller :users, 'User Managment'

    swagger_api :create do
      summary 'Creates a new User'
      param :form, :auth_token, :string, :required, 'random_auth_token'
      response :unauthorized
    end

    def create
      begin
        @user = User.create!
        render_json data: { token: @user.auth_token }
      rescue Mongoid::Errors::MongoidError
        render_json data: { token: nil }
      end
    end
  end
end
