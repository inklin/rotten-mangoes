Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :movies
  # get 'movies',          to: 'movies#index'
  # get 'movies/new',      to: 'movies#new'
  # get 'movies/:id/edit', to: 'movies#edit'
  # get 'movies/:id',      to: 'movies#show', as: 'movie' # necessary for the update action!
  # patch 'movies/:id',    to: 'movies#update'
  # delete 'movies/:id',   to: 'movies#delete'
  # post 'movies',         to: 'movies#create'
end
