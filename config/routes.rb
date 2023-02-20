Rails.application.routes.draw do
  root 'searches#index'
  resources :messages
  resources :searches, only: [:index]
end
