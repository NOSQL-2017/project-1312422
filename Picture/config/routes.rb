Rails.application.routes.draw do
  resources :users
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
  resources :sessions, only: [:new, :create, :destroy]
end
