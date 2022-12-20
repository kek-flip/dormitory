Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'session/login'
  get 'session/create'
  get 'session/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
