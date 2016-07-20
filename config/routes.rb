Rails.application.routes.draw do
  
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :masquerades, only: [:new, :destroy]
  end
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users
  end
  
  root 'movies#index'
  
end
