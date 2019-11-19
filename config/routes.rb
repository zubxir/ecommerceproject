# frozen_string_literal: true

Rails.application.routes.draw do
  get '/welcome', to: 'products#index'
  get '/products', to: 'products#index'
  get '/about', to: 'about#index'
  get '/products/:id', to: 'products#show', id: /\d+/

  root to: 'welcome#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
