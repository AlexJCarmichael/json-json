Rails.application.routes.draw do
  namespace :api do
    root 'posts#index'
    resources :posts
    resources :users
  end
end
