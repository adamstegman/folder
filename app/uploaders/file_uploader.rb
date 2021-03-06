# coding: UTF-8

class FileUploader < CarrierWave::Uploader::Base
  # TODO: include CarrierWave::MimeTypes
  storage :file

  # Override the directory where uploaded files will be stored.
  def store_dir
    'file_uploads'
  end

  def folder_id
    @folder_id ||= SecureRandom.hex
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{folder_id}#{File.extname(super)}"
  end
end
