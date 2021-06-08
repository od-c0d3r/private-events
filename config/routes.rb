Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  root to: 'events#index'
  resources :users
  resources :events
  post 'events/new', to: 'events#create'
end
