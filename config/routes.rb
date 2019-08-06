Rails.application.routes.draw do
  namespace :v1 do
    resources :users, only: :create
    resources :pictures
  end
end
