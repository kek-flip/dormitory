Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  get 'users/:login', to: 'users#show'

  get 'session/login'
  post 'session/create'
  get 'session/logout'

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#view"
end
