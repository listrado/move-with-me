Rails.application.routes.draw do
  get 'journey_match/new'
  get 'journey_match/create'
  get 'journeys/index'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show]
  resources :journeys, only: %i[new create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
