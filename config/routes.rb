Rails.application.routes.draw do

  get 'movies', to: 'movies#index'
  get 'movies/new', to: 'movies#new'
  get 'movies/:id', to: 'movies#show'
  post 'movies',    to: 'movies#create'
  
end
