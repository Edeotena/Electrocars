Rails.application.routes.draw do
  root 'points#index'

  resources :points do
    resources :stations do
      resources :connectors
    end
  end
end
