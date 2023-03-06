Rails.application.routes.draw do

  get 'todos/index' => 'todos#index'
  get 'todos/show/:id' => 'todos#show'
  post "todos" => "todos#create"
  put "todos/:id" => "todos#update"
  delete '/todos/destroy_doneTask' => 'todos#destroy_doneTask'
  delete '/todos/destroy_all' => 'todos#destroy_all'
  delete "todos/:id" => "todos#destroy"
    
  resources :todos, only: %i[index create update destroy]
  

  post '/signup' => 'registrations#signup'

  resources :registrations


  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  get '/logged_in' => 'sessions#logged_in?'

  resources :sessions

  get 'user/index', to: 'users#index'
  get '/user_todos/:id' => 'users#user_todos'
  get '/user/:id'=> 'users#show'
  put "user/:id" => "users#update"
  delete "user/:id" => 'users#destroy'

  resources :users

end