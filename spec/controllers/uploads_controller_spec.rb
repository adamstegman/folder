# coding: UTF-8

require 'spec_helper'

describe UploadsController do
  describe 'GET "index"' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET "show"' do
    it 'returns http success' do
      # FIXME
    end

    it 'renders the show_image template if the file is an image' do
      # FIXME
    end
  end

  describe 'GET "raw"' do
    it 'returns http success' do
      # FIXME
    end
  end

  describe 'GET "new"' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST "create"' do
    it 'creates a new upload' do
      # FIXME
    end
  end
end
