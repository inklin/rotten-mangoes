Rails.application.routes.draw do

  get 'movies',         to: 'movies#index'
  get 'movies/new',     to: 'movies#new'
  get 'movies/:id/edit',to: 'movies#edit'
  get 'movies/:id',     to: 'movies#show', as: 'movie'
  patch 'movies/:id',    to: 'movies#update' 
  post 'movies',        to: 'movies#create'

end
