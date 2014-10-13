Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  devise_for :users

  resources :users
  resources :articles

  post 'users/:id/edit', to: "users#update"
end
