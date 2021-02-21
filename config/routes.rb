Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]

  namespace :app do
    resources :tweets, only: %i[index create]

    resources :users, only: %i[edit] do
      resources :followings, only: %i[create]
    end

    resources :followings, only: %i[destroy]
  end
end
