Rails.application.routes.draw do
  devise_for :vets, path: 'vets', controllers: { sessions: "vets/sessions", registrations: "vets/registrations" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  root to: "pages#home"
  authenticated :user do
    root 'pages#home', as: :authenticated_user_root
  end
  authenticated :vet do
    root 'pages#home', as: :authenticated_vet_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/pages/profile', to: 'pages#profile'
  #resources :users
  resources :pets do
    resources :appointments, only: [:new, :create]
    resources :owner_records, only: [:new, :create]
  end

  resources :appointments, except: [:new, :create]
  resources :owner_records, except: [:new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
