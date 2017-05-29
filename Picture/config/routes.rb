Rails.application.routes.draw do
  namespace :admin do
    resources :images
    resources :friends
    resources :users

    root to: "images#index"
  end

  get 'friends/index'

  get 'friends/create'

  get 'friends/destroy'

  resources :images
  resources :users
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions' => 'sessions#create', as: :create

  get 'sessions/destroy'

  root 'pages#home'

  get 'login' => 'sessions#new'

  get 'logout' => 'sessions#destroy'
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
  get 'register' => 'users#new', as: :register
  get 'info' => 'persionals#personal_page'
  get 'auth/:provider/callback', to: "sessions#create"
  get 'newimage' => 'images#new'
  get 'share' => 'images#share'
  get 'unshare' => 'images#unshare'
  resources :sessions, only: [:new, :create, :destroy]
end
