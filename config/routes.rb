Rails.application.routes.draw do

  get 'todos' => 'todos#index'
  get 'todos/:id' => 'todos#show'
  post "todos" => "todos#create"
  put "todos/:id" => "todos#update"
  delete '/todos/done' => 'todos#destroy_done'
  delete '/todos/all' => 'todos#destroy_all'
  delete "todos/:id" => "todos#destroy"
    
  resources :todos, only: %i[index create update destroy]
  
  post '/signup' => 'registrations#signup'

  resources :registrations

  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  get '/logged_in' => 'sessions#logged_in?'

  resources :sessions

  get 'users' => 'users#index'
  get '/users/:id' => 'users#show'
  put "user_email/:id" => "users#update_email"
  put "user_password/:id" => "users#update_password"
  delete "users/:id" => 'users#destroy'

  resources :users
end
