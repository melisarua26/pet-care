Rails.application.routes.draw do
  devise_for :vets, path: 'vets', controllers: { sessions: "vets/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
