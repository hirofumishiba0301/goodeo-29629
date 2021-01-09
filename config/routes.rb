Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'
  get 'videos/search'

  resources :users do
    resources :favorites
  end

  post '/favorite/:video_id', to: 'favorites#create', as: 'love'
  delete '/favorite/:video_id', to: 'favorites#destroy', as: 'unlove'

  resources :videos do
    resources :thumbnails
    resources :goodjobs
  end

  post '/goodjob/:video_id', to: 'goodjobs#create', as: 'like'
  delete '/goodjob/:video_id', to: 'goodjobs#destroy', as: 'unlike'
end
