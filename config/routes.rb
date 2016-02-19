Rails.application.routes.draw do
  root 'home#show'

  get 'auth/instagram',                                   as: :login
  get 'auth/instagram/callback',  to: 'sessions#create'
  get 'logout',                   to: 'sessions#destroy', as: :logout
  get 'users',                    to: 'users#show'

end
