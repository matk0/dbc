Rails.application.routes.draw do
  resources :transactions
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  resources :wallets
  root to: "wallets#index"
end
