class UserSerializer < ActiveModel::Serializer
  attributes :_id, :token, :email
end
