Rails.application.routes.draw do

  root to: 'movies#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit]
  end
  
end
