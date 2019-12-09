Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: %i[show] do 
  	resources :groups, only: %i[show] do
      resources :messages, only: %i[new create index]
  	end
  end
  resources :journey_matches, only: %i[new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
