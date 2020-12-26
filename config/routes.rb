Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :user
  root to: "messages#index"
end
