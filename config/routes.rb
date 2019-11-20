# frozen_string_literal: true

Rails.application.routes.draw do
  get '/welcome', to: 'products#index'
  get '/products', to: 'products#index'
  get '/about', to: 'about#index'
  get '/products/:id', to: 'products#show', id: /\d+/
  get '/category', to: 'category#index'
  get '/category/:id', to: 'category#show', id: /\d+/
  get '/', to: 'welcome#index'

  root to: 'products#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
