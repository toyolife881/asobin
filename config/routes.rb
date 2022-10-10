Rails.application.routes.draw do
  get 'achivement_plays/create'
  get 'users/show'
  get 'favorite_plays/create'
  get 'favorite_plays/destroy'
  devise_for :users
  root to: 'plays#index'
  resources :plays do
    resources :favorite_plays, only: [:create, :destroy]
    resources :achivement_plays, only: [:index, :create]
    collection do
      get 'list'
      get 'outdoor'
      get 'indoor'
      get 'production'
      get 'music'
      get 'reading'
      get 'game'
      get 'sports'
      get 'cooking'
      get 'others'
    end
  end
  resources :users, only: :show
end