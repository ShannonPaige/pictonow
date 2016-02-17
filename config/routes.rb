Rails.application.routes.draw do
  root 'home#show'

  get 'auth/instagram',                                   as: :login
  get 'auth/instagram/callback',  to: 'sessions#create'
  get 'logout',                   to: 'sessions#destroy', as: :logout
  get 'user',                     to: 'users#show'

  namespace :user do
    resources :pictures,  only: [:index]
  end
end
