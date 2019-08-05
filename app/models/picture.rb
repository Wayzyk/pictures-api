class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  field :blob, type: BSON::Binary

  belongs_to :user
end
