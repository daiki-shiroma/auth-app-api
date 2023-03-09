Rails.application.routes.draw do

  get 'todos/index' => 'todos#index'
  get 'todos/show/:id' => 'todos#show'
  post "todos" => "todos#create"
  put "todos/:id" => "todos#update"
  delete '/todos/destroy_doneTask' => 'todos#destroy_Done_Task'
  delete '/todos/destroy_all' => 'todos#destroy_All_Task'
  delete "todos/:id" => "todos#destroy"
    
  resources :todos, only: %i[index create update destroy]
  
  post '/signup' => 'registrations#signup'

  resources :registrations

  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  get '/logged_in' => 'sessions#logged_in?'

  resources :sessions

  get 'user/index', to: 'users#index'
  get '/user_todos/:id' => 'users#user_Todos'
  get '/user/:id'=> 'users#show'
  put "user_email/:id" => "users#update_Email"
  put "user_password/:id" => "users#update_Password"
  delete "user/:id" => 'users#destroy'

  resources :users

end