# frozen_string_literal: true

class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :picture, ::PictureUploader

  field :height, type: Integer
  field :width, type: Integer

  belongs_to :user

  validates :height, :width, :original_picture, presence: true
  validates :height, :width, numericality: { greater_than: 0 }

  after_update :reload_picture

  def picture_url
    original_picture.scaled.url
  end

  private

  def reload_picture
    original_picture.recreate_versions!
  end
end
