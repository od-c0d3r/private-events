Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  root to: 'events#index'
  resources :users
  resources :events
  resources :tokens
  post 'events/new', to: 'events#create'
  delete '/tokens', to: 'tokens#destroy'
end
