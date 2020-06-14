Rails.application.routes.draw do

  root to: 'board#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :board, only: [:index, :show, :create, :destroy]
      post 'board/find', to: 'board#find'
    end
  end

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :user, only: [:index, :create]
      post 'user/new', to: 'user#new'
      post 'user/delete', to: 'user#destroy'
      get 'user/invest', to: 'user#invest'
    end
  end

end
