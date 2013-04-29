# coding: UTF-8

Folder::Application.routes.draw do
  root to: 'uploads#new'
  resources :uploads, only: [:index, :new, :create, :show]
end
