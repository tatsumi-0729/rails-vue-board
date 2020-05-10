Rails.application.routes.draw do

  namespace :api, {format: 'json'} do
    resources :board, only: [:index]
  end

end
