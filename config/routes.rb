Rails.application.routes.draw do
  # rutas de devise, el prefijo es para poder tener acciones CRUD para que el admin pueda editar usuarios creados.
  devise_for :users, :path_prefix => 'my', :controllers => { :registrations => 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Rutas de users

  resources :users, only:%i[index show edit update destroy]

  # Rutas de entrances
  resources :entrances, only: %i[index new create show]

  # Rutas de exits
  resources :exits, only: %i[index new create show]

  # Rutas de companies
  resources :companies do
    # Rutas nesteadas de company vehicles  Ver con María las diapos de nested resources ya que al parecer SEUD no se nestea.
    resources :company_vehicles, only: %i[new create]
  end
  # Rutas no nesteadas de company vehicles (solo destroy)
  resources :company_vehicles, only: %i[edit update destroy]

  # Defines the root path route ("/")
  root 'pages#home'
  # Rutas admin
  resources :admins
end
