class UserpicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "#{ENV['STORAGE_PATH']}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/original"
  end

  def filename
    "#{::SecureRandom.hex(8)}#{File.extname(original_filename).downcase}"  if original_filename
  end


  version :small do
    process :resize_to_fit => [100, 100]

    def store_dir
      "#{ENV['STORAGE_PATH']}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/small"
    end
  end

end