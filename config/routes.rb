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
  resources :companies do
    # Rutas nesteadas de company vehicles  Ver con María las diapos de nested resources ya que al parecer SEUD no se nestea.
    resources :company_vehicles, only: %i[new create]
  end
  # Rutas no nesteadas de company vehicles (solo destroy)
  resources :company_vehicles, only: %i[edit update destroy]

  # Defines the root path route ("/")
  root 'pages#home'
end
