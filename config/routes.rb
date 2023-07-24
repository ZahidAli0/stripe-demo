Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    passwords: 'devise/passwords',
    registrations: 'devise/registrations'
  }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products

  resources :payments


  root 'products#index'

  get '/index' => 'products#index'

  get '/post' => 'products#show'


  get '/newProduct' => 'products#new'
  post 'checkout/create' => 'checkout#create', as: "checkout_create"
  resources :webhooks, only: [:create]


  post 'payments/create' 
  get  'payments/success' 
  get  'payments/cancel'
end
