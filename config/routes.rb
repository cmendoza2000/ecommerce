Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  devise_for :users

  resources :users
  resources :articles

  get 'users/:id/edit', to: "users#edit", method: "put"
end
