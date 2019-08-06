class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :image, ::ImageUploader

  field :blob, type: BSON::Binary
  field :image, type: String

  belongs_to :user

  validates :image, presence: true
end
