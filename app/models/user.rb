class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :token, type: String, default: proc { SecureRandom.base64(12) }
  field :email, type: String

  has_many :pictures

  validates :email, presence: true, uniqueness: true
end
