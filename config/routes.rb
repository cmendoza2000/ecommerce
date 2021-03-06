Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  devise_for :users

  resources :users
  resources :articles
  
  # user routes
  post 'users/:id/edit', to: 'users#update'
  get 'users/:id/questions', to: 'users#show_questions', as: 'user_questions'
  post 'users/:id/questions/answer', to: 'users#answer_question', as: 'answer_question'

  # article routes
  post 'articles/new', to: 'articles#create'
  post 'articles/:id/edit', to: 'articles#update'
  get 'articles/category/:category', to: 'articles#filter_by_category', as: 'articles_by_category'
  get 'articles/search_results/:query', to: 'articles#search', as: 'search_results'
  post 'articles/:id/create_question', to: 'articles#create_question', as: 'new_question'
end
