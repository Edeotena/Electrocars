Rails.application.routes.draw do
  root 'points#index'

  resources :points do
    resources :stations
  end
end
