Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:show, :create]
  resources :buyers, only: [:new, :create]
  resources :farmers, only: [:new, :create]
  resources :buyer_requests, only: [:index, :new, :create]
  resources :farmer_responses, only: [:new, :create]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
