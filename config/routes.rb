Rails.application.routes.draw do
  get 'journeys/index'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show]
  resources :journeys, only: %i[new create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
