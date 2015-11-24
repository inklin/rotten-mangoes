Rails.application.routes.draw do

  root to: 'movies#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  # get 'movies',          to: 'movies#index'
  # get 'movies/new',      to: 'movies#new'
  # get 'movies/:id/edit', to: 'movies#edit'
  # get 'movies/:id',      to: 'movies#show', as: 'movie' # necessary for the update action!
  # patch 'movies/:id',    to: 'movies#update'
  # delete 'movies/:id',   to: 'movies#delete'
  # post 'movies',         to: 'movies#create'
end
