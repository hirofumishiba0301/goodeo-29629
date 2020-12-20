Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'
  resources :videos do
    resources :thumbnails
  end
end
