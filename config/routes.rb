Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  devise_for :users

  resources :users
  resources :articles
  
  # user routes
  post 'users/:id/edit', to: 'users#update'

  # article routes
  post 'articles/new', to: 'articles#create'
end
