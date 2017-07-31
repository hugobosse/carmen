
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

  devise_for :users, controllers: { sessions: 'sessions' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about/', to: 'pages#about', as: 'about'

  resources :demands, only: [:create]
end
