Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  resources :sessions, only: [:new, :create, :destroy]
  resources :movies
  resources :users, only: [:new, :create]
  
  root 'movies#index'
  
end
