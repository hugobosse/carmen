
Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :budgets
    resources :demands
    resources :pings
    resources :reservations
    resources :restaurants
    resources :statuses
    resources :tags
    resources :taggings

    root to: "users#index"
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  get '/about/', to: 'pages#about', as: 'about'
  get 'verify', to: 'verifications#new'
  post 'verify', to: 'verifications#create'

  resources :demands, only: [:create]

end
