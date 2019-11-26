# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  devise_for :users
  get '/welcome', to: 'welcome#index'
  get '/products', to: 'products#index'
  get '/products/cart', to: 'products#cart'
  get '/products/checkout', to: 'products#checkout'
  get '/products/submission', to: 'products#submission'
  get '/about', to: 'about#index'
  get '/products/:id', to: 'products#show', id: /\d+/
  get '/category', to: 'category#index'
  get '/category/:id', to: 'category#show', id: /\d+/
  get '/', to: 'products#index'

  root 'products#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
