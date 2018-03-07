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
  get "/users" => "users#index"
  get "/users/new" => 'users#new'
  get "/users/edit" => 'users#edit'
  post "/users" => 'users#create'
  delete "/users/:id" => 'users#destroy'
  patch "/users" => 'users#update'

  # Reservation
  get '/reservations' => 'reservations#index'
  get '/reservations/canceled' => 'reservations#canceled'
  get '/reservations/show_all' => 'reservations#show_all'
  get '/reservations/:id/new_review' => 'reservations#new_review'
  post '/reservations/:id/new_review' => 'reservations#create_review'
  delete '/reservations/:id' => 'reservations#destroy'
  post '/reservations' => 'reservations#create'

  # Sessions
  get "/login" => "sessions#new"
  get "/sessions/new" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
