# coding: UTF-8

# Public: An uploaded file and its metadata.
class Upload
  # Internal: The path in which files are stored.
  UPLOAD_DIR = FileUploader.new.store_dir.freeze

  attr_accessor :filename

  # Public: Returns whether or not the file is an image.
  def image?
    %w(jpg jpeg gif png).include? File.extname(filename)[1..-1]
  end

  # Public: Returns the path to the file, relative to the `public` directory.
  def path
    File.join(UPLOAD_DIR, filename)
  end

  def initialize(filename)
    self.filename = filename
  end

  def self.find(filename)
    self.new(filename)
    # TODO: throw exception when not found, like AR
  end
end
