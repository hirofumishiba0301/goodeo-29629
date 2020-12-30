Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'
  resources :videos do
    resources :thumbnails
    resources :goodjobs
  end

  post '/goodjob/:video_id', to: 'goodjobs#create', as: 'like'
  delete '/goodjob/:video_id', to: 'goodjobs#destroy', as: 'unlike'
end
