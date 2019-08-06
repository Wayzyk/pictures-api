# frozen_string_literal: true

class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :picture, ::ImageUploader

  field :height, type: Integer
  field :width, type: Integer

  belongs_to :user

  validates :height, :width, presence: true
  validates :height, :width, numericality: { greater_than: 0 }

  after_update :reload_picture

  def picture_url
    orig_picture.scaled.url
  end

  private

  def reload_picture
    orig_picture.recreate_versions!
  end
end
