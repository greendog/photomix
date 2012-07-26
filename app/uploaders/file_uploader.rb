# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

  @@generate_file_name = ''
  @@original_filename  = ''

  # Include RMagick or ImageScience support
  #     include CarrierWave::RMagick
  #     include CarrierWave::ImageScience
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader
  if ENV['S3_KEY']
    storage :fog

    def cache_dir
      "#{Rails.root.to_s}/tmp/uploads" if ENV['HEROKU'] == 'true'
    end
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    #{}"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    ENV['STORAGE_PATH'] + "/files/#{model.album.path}/#{model.id}"
  end

  def filename
    unless @@original_filename == original_filename
      @@original_filename = original_filename
      @@generate_file_name = "#{::SecureRandom.hex(8)}#{File.extname(original_filename).downcase}"  if original_filename
    end
    @@generate_file_name
  end

  # Provide a default URL as a default if there hasn't been a file uploaded
  #     def default_url
  #       "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #     end

  # Process files as they are uploaded.
  #     process :scale => [200, 300]
  #
  #     def scale(width, height)
  #       # do something
  #     end

  # Create different versions of your uploaded files
  version :collection do
    process :resize_to_fill => [260, 180]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}/#{model.id}"
    end
  end

  version :album do
    process :resize_to_fill => [100, 100]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}/#{model.id}"
    end
  end

  ######################################################################################################################
  # Note
  # The default grid system provided in Bootstrap utilizes 12 columns that
  # render out at widths of 724px, 940px (default without responsive CSS included), and 1170px.
  # Below 767px viewports, the columns become fluid and stack vertically.

  version :middle do
    process :resize_to_fit => [724, 500]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}/#{model.id}"
    end
  end

  version :large do
    process :resize_to_fit => [940, 500]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}/#{model.id}"
    end
  end

  version :largest do
    process :resize_to_fit => [1170, 500]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}/#{model.id}"
    end
  end
  ######################################################################################################################


  # Add a white list of extensions which are allowed to be uploaded,
  # for images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png bmp tiff)
  end
end
