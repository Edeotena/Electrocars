Rails.application.routes.draw do
  root 'points#index'

  resources :points do
    resources :stations do
      resources :connectors
    end
  end
  resources :sessions, only: [:index, :create]
  post 'sessions/:id/stop', to: 'sessions#stop'
  match 'sessions/:id/stop', to: 'sessions#stop', via: 'post', as: 'session_stop'
end
