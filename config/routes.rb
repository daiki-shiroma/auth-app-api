Rails.application.routes.draw do

  get 'todos', to: 'todos#index'
  post "todos" => "todos#create"
  put "todos/:id" => "todos#update"
  delete '/todos/destroy_doneTask', to: 'todos#destroy_doneTask'
  delete '/todos/destroy_all', to: 'todos#destroy_all'
  delete "todos/:id" => "todos#destroy"
    
  resources :todos, only: %i[index create update destroy]
  resources :users

  post '/signup', to: 'registrations#signup'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in?'

  get '/user_index', to: 'users#user_index'
  get '/user_get/:id', to: 'users#user_get'
  get '/user_todos', to: 'users#user_todos'

end