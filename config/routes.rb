# coding: UTF-8

Folder::Application.routes.draw do
  resources :uploads, only: [:index, :new, :create, :show]
end
