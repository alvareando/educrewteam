Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard", as: "dashboard"

  resources :sessions, only: [:index, :show, :new, :create] do
    resources :session_participation, only: [:create]
    resources :chatrooms, only: [:create]
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:index, :create, :destroy]
  end

end
