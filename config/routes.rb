Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]

  namespace :app do
    resources :tweets, only: %i[index create] do
      resources :likes, only: %i[create], module: :tweets
    end

    resources :users, only: %i[show] do
      resources :followings, only: %i[create]
    end

    resources :followings, only: %i[destroy]
  end
end
