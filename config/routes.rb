Rails.application.routes.draw do
  root 'posts#index'
  namespace :api do
    root 'posts#index'
    resources :posts
    resources :users
  end
end
