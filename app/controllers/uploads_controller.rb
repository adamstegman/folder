# coding: UTF-8

class UploadsController < ApplicationController
  def index
    # TODO
  end

  def show
    # TODO: retrieve metadata like content type and dimensions
    @file = Upload.find(params[:id])
    unless @file
      raise ActionController::RoutingError.new(params[:id])
    end
    if @file.image?
      render 'show_image'
    else
      render 'show_file'
    end
  end

  def raw
    get(params[:id], disposition: :inline)
  rescue ArgumentError => e
    Rails.logger.info "#{self.class.name}#raw: #{e.message}"
    raise ActionController::RoutingError.new(params[:id])
  end

  def download
    get(params[:id], disposition: :attachment)
  rescue ArgumentError => e
    Rails.logger.info "#{self.class.name}#download: #{e.message}"
    raise ActionController::RoutingError.new(params[:id])
  end

  def new
  end

  def create
    # TODO: handle empty file
    uploader = FileUploader.new
    uploader.store!(params[:upload])
    redirect_to upload_path(uploader.folder_id)
  end

  private

  # Internal: Sends the upload to the browser.
  #
  # id      - The upload id.
  # options - A Hash of options given to `send_file`.
  #
  # Raises ArgumentError if the upload is not found.
  def get(id, options = {})
    upload = Upload.find(id)
    unless upload
      raise ArgumentError.new("No upload found for #{id}")
    end
    send_file "public#{upload.path}", options
  end
end
