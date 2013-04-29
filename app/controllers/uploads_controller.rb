# coding: UTF-8

class UploadsController < ApplicationController
  def index
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
      # TODO
    end
  end

  def raw
    downloader = FileUploader.new
    file = downloader.retrieve_from_store!(params[:id])
    # TODO: send_data file
  end

  def new
  end

  def create
    # TODO: handle empty file
    uploader = FileUploader.new
    uploader.store!(params[:upload])
    redirect_to upload_path(uploader.folder_id)
  end
end
