# coding: UTF-8

class ImagesController < ApplicationController
  def index
  end

  def show
    # TODO: retrieve metadata like dimensions
    @image = Image.find(params[:id])
  end

  def raw
    downloader = ImageUploader.new
    image = downloader.retrieve_from_store!(params[:id])
    # TODO: send_data image
  end

  def new
  end

  def create
    # TODO: handle empty file
    uploader = ImageUploader.new
    uploader.store!(params[:image_file])
    redirect_to image_path(uploader.filename)
  end
end
