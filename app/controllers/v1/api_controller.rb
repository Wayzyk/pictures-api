# frozen_string_literal: true

module V1
  class ApiController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    protected

    def authenticate_user
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token|
        @user = User.find_by(auth_token: token)
      end
    end

    def unauthorized_error
      render_json error: [{ code: 'WRONG_CREDENTIALS', message: 'Unauthorized token' }],
                  status: 401
    end

    def render_json(data: nil, error: nil, status: 200)
      response = {
        data: data
      }
      response[:error] = error if error

      render json: response, status: status
    end
  end
end
