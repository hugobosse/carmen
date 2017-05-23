Rails.application.routes.draw do
  get 'cuisines/new'

  get 'cuisines/create'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about/', to: 'pages#about', as: 'about'

  resources :demands, only: [:create]

  match '/google0a77a05d8f74e025.html', to: proc { |env| [200, {}, ["google-site-verification: google0a77a05d8f74e025.html"]] }

end
