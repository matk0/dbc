Rails.application.routes.draw do
  resources :wallets
  root to: "wallets#index"
end
