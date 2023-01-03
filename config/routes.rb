Rails.application.routes.draw do
  # rutas de devise, el prefijo es para poder tener acciones CRUD para que el admin pueda editar usuarios creados.
  devise_for :users, :path_prefix => 'my', :controllers => { :registrations => 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Rutas de users

  resources :users, only: %i[index show edit update destroy] do
    patch 'status', on: :member
  end

  # Rutas de entrances
  resources :entrances, only: %i[index new create show]

  # Rutas de exits
  resources :exits, only: %i[index new create show]

  # Rutas de companies
  resources :companies do
    patch 'status', on: :member
    # Rutas nesteadas de company vehicles  Ver con María las diapos de nested resources ya que al parecer SEUD no se nestea.
    resources :company_vehicles, only: %i[new create]
    collection do
      get 'vehicles'
    end
  end
  # Rutas no nesteadas de company vehicles
  resources :company_vehicles, only: %i[edit update destroy] do
    patch 'status', on: :member
  end

  # Defines the root path route ("/")
  root 'pages#home'
  # Rutas admin
  resources :admins
end
