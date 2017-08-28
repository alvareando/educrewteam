Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :sessions, only: [:index, :show, :new, :create] do
    resources :session_participation, only: [:create]
    resources :chatrooms, only: [:create]
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:index, :create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
