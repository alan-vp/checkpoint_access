Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Rutas de users
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'show_user'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'

  # Rutas de entrances
  resources :entrances, only: %i[index new create show]

  # Rutas de companies
  resources :companies, except: %i[show] do
    resources :company_vehicles
  end

  # Defines the root path route ("/")
  root 'pages#home'
end
