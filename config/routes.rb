# coding: UTF-8

ImageHost::Application.routes.draw do
  resources :images, only: [:index, :new, :create, :show]
end
