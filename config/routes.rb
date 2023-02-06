Rails.application.routes.draw do
  root 'points#index'

  get '/points', to: 'points#index'
end
