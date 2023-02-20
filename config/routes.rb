Rails.application.routes.draw do
  root 'searches#home'
  resources :messages
  resources :searches, only: [:index]
end
