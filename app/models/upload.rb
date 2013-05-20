# coding: UTF-8

# Public: An uploaded file and its metadata.
Upload = Struct.new(:id, :filename) do
  # Internal: An Array of file extensions that are considered images.
  IMAGE_EXTENSIONS = %w(jpg jpeg gif png)

  # Internal: The path in which files are stored.
  UPLOAD_DIR = FileUploader.new.store_dir.freeze

  # Public: Returns whether or not the file is an image.
  def image?
    IMAGE_EXTENSIONS.include? File.extname(filename)[1..-1]
  end

  # Public: Returns the path to the file, relative to the `public` directory.
  def path
    "/#{UPLOAD_DIR}/#{filename}"
  end

  def self.find(id)
    file = nil
    FileUtils.chdir(Rails.root.join('public', UPLOAD_DIR)) do
      file = Dir["#{id}.*"].first
    end
    self.new(id, file) if file
  end
end
