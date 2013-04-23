# coding: UTF-8

require 'spec_helper'

describe ImagesController do
  describe 'GET "index"' do
    it 'returns http success' do
      get :index
      response.should be_success
    end
  end

  describe 'GET "show"' do
    it 'returns http success' do
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
      response.should be_success
    end
  end

  describe 'POST "create"' do
    it 'creates a new image' do
      # FIXME
    end
  end
end
