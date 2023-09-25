Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  root 'landing#index'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups do
    resources :payments
  end

 
end
