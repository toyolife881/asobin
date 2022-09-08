Rails.application.routes.draw do
  get 'favorite_plays/create'
  get 'favorite_plays/destroy'
  devise_for :users
  root to: 'plays#index'
  resources :plays do
    resources :favorite_plays, only: [:create, :destroy]
  end
  resources :users, only: :show
end