# coding: UTF-8

Folder::Application.routes.draw do
  resources :images, only: [:index, :new, :create, :show]
end
