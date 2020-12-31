Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :users
  root to: "messages#index"
end
