Rails.application.routes.draw do
  root 'points#index'

  resources :points do
    resources :stations do
      resources :connectors
    end
  end
  resources :sessions, only: [:show, :index, :create]
  get 'sessions/:id/stop', to: 'sessions#stop'
end
