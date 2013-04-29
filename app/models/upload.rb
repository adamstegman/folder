# coding: UTF-8

# Public: An uploaded file and its metadata.
Upload = Struct.new(:filename) do
  # Internal: The path in which files are stored.
  UPLOAD_DIR = FileUploader.new.store_dir.freeze

  # Public: Returns whether or not the file is an image.
  def image?
    %w(jpg jpeg gif png).include? File.extname(filename)[1..-1]
  end

  # Public: Returns the path to the file, relative to the `public` directory.
  def path
    File.join(UPLOAD_DIR, filename)
  end

  def self.find(id)
    file = nil
    FileUtils.chdir File.join('public', UPLOAD_DIR) do
      file = Dir["#{id}.*"].first
    end
    self.new(file) if file
  end
end
