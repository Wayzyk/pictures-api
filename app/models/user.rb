class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :token, type: String
  field :email, type: String

  has_many :pictures

  validates :email, presence: true, uniqueness: true
end
