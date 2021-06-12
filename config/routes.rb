Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  root to: 'events#index'
  resources :users
  resources :events, only: [:new, :create, :show, :index]
  resources :tokens, only: [:new, :create, :destroy]
  get 'events/new', to: 'events#new'
  post 'events/new', to: 'events#create'
  delete '/tokens', to: 'tokens#destroy'
end
