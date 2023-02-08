Rails.application.routes.draw do
  root 'points#index'

  resources :points do
    resources :stations do
      resources :connectors
    end
  end
  resources :sessions, only: [:index, :create, :show]
  post 'sessions/:id/stop', to: 'sessions#stop'
  match 'sessions/:id/stop', to: 'sessions#stop', via: 'post', as: 'session_stop'
end
