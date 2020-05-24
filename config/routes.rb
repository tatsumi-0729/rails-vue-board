Rails.application.routes.draw do

  root to: 'board#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :board, only: [:index, :show, :create, :destroy]
    end
  end

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :session, only: [:index, :create]
      post 'session/new', to: 'session#new'
    end
  end

end
