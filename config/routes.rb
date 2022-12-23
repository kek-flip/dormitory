Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  get 'users/:login', to: 'users#show'

  get 'session/login'
  post 'session/create'
  get 'session/logout'

  resources :posts, only: [ :index, :edit, :update, :new ]

  resources :requests, only: [ :edit, :update, :new, :create ]
  get 'request/update/take', to: 'requests#update_status_to_took'
  get 'request/update/finish', to: 'requests#update_status_to_finished'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#view"
end
