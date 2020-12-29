Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :users
  root to: "messages#index"
end
