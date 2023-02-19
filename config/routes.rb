Rails.application.routes.draw do
  resources :messages
  resources :searches, only: [:index]
end
