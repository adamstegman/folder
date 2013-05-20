# coding: UTF-8

Folder::Application.routes.draw do
  root to: 'uploads#new'
  resources :uploads, only: [:index, :new, :create, :show] do
    member do
      get :download
      get :raw
    end
  end
end
