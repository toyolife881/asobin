Rails.application.routes.draw do
  devise_for :users, controllers: {
    # /app/controllers/users配下の、registrations_controller.rbが参照される
    registrations: 'users/registrations'
  }
  root to: 'plays#index'
  resources :plays, only: :index
end
