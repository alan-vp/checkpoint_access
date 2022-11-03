Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'show_user'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'

  # Defines the root path route ("/")
   root 'pages#home'
end
