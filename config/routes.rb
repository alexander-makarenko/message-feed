Rails.application.routes.draw do

  root 'messages#index'
  
  get 'signin', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :messages, except: [:new, :show, :destroy]
end