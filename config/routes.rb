Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'
  resources :videos do
    resources :thumbnails
    resources :goodjob, only: [:create, :destroy]
  end
end
