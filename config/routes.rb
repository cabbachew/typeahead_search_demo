Rails.application.routes.draw do
  get 'searches/index'
  resources :messages
  resources :searches, only: [:index]
end
