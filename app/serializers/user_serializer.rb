# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :_id, :auth_token
end
