Rails.application.routes.draw do
  devise_for :users
  resources :messages do
    collection do
      get 'search'
    end
  end
  resources :users
  root to: "messages#index"
end
