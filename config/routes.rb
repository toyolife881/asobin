Rails.application.routes.draw do
  root to: 'plays#index'
  resources :plays, only: :index
end
