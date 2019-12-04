Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show]
  resources :groups, only: %i[index new create]
  resources :journeys, only: %i[new create]
  resources :journey_matches, only: %i[new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
