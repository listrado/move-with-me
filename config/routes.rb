Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: %i[show] do
  	resources :journey, only: %i[new create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
