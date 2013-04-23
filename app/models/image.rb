# coding: UTF-8

# Public: A stored image and its metadata.
class Image
  # Internal: The path in which images are stored.
  IMAGE_DIR = ImageUploader.new.store_dir.freeze

  attr_accessor :filename

  # Public: Returns the path to the image, relative to the `public` directory.
  def path
    File.join(IMAGE_DIR, filename)
  end

  def initialize(filename)
    self.filename = filename
  end

  def self.find(filename)
    self.new(filename)
    # TODO: throw exception when not found, like AR
  end
end
