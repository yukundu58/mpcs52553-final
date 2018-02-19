Rails.application.routes.draw do

  root 'libraries#index'
  # Library
  get '/libraries' => 'libraries#index'
  get '/libraries/new' => 'libraries#new'
  post '/libraries' => 'libraries#create'
  get '/libraries/:id' => 'libraries#show'
  get '/libraries/:id/edit' => 'libraries#edit'
  get '/libraries/:id/show_reservations' => 'libraries#show_reservations'
  patch '/libraries/:id' => 'libraries#update'
  delete '/libraries/:id' => 'libraries#destroy'

  # User

  # Reservation

  # Sessions
  get "/sessions/new" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
