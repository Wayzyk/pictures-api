class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "#{model.id}"
  end

  version :scaled do
    process :scale
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  private

  def scale
    resize_to_fill(model.width, model.height)
  end
end
