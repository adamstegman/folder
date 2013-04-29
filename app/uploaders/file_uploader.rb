# coding: UTF-8

class FileUploader < CarrierWave::Uploader::Base
  # TODO: include CarrierWave::MimeTypes
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    'assets'
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    @_filename ||= SecureRandom.hex
  end
end
