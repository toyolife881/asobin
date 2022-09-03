Rails.application.routes.draw do
  devise_for :users
  root to: 'plays#index'
  resources :plays, only: [:index, :new, :create]
end
