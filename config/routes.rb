Rails.application.routes.draw do

  get 'todos/index' => 'todos#index'
  get 'todos/show/:id' => 'todos#show'
  post "todos" => "todos#create"
  put "todos/:id" => "todos#update"
  delete '/todos/destroy_done_todo' => 'todos#destroy_done_todo'
  delete '/todos/destroy_all_todo' => 'todos#destroy_all_todo'
  delete "todos/:id" => "todos#destroy"
    
  resources :todos, only: %i[index create update destroy]
  
  post '/signup' => 'registrations#signup'

  resources :registrations

  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  get '/logged_in' => 'sessions#logged_in?'

  resources :sessions

  get 'user/index' => 'users#index'
  get '/user/:id' => 'users#show'
  put "user_email/:id" => "users#update_email"
  put "user_password/:id" => "users#update_password"
  delete "user/:id" => 'users#destroy'

  resources :users

end