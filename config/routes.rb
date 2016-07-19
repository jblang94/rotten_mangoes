Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users
  end
  
  root 'movies#index'
  
end
