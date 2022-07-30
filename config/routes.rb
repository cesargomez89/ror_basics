# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'posts#index'

  resources :likes, only: %i[create destroy]

  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
