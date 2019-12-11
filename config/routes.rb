Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'refresh_messages', to: 'messages#refresh', as: 'refresh_messages'

  resources :users, only: %i[show] do
    resources :journeys, only: %i[destroy]
  	resources :groups, only: %i[show] do

      resources :messages, only: %i[index new create index]
  	end
  end

  resources :groups, only: [] do
    resources :journeys, only: %i[create]
  end

  resources :journey_matches, only: %i[new create] do
    get :find, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
