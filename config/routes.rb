Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/tutor_dashboard", to: "pages#tutor_dashboard", as: "tutor_dashboard"

  resources :sessions, only: [:index, :show, :new, :create] do
    resources :session_participations, only: [:create]
    resources :chatrooms, only: [:create]
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:index, :create, :destroy]
  end

  resources :users, only: [:update]

  get "/become-a-tutor/", to: "users#become_tutor", as: "become_tutor"

  patch "/become-a-tutor/", to: "users#update_to_tutor", as: "update_to_tutor"


  mount Attachinary::Engine => "/attachinary"

end
