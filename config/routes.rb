Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/concept/', to: 'pages#concept', as: 'concept'
  get '/about/', to: 'pages#about', as: 'about'

end
