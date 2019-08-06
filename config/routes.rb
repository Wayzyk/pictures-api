Rails.application.routes.draw do
  namespace :v1 do
    resource :users, only: :create
    resource :pictures, only: [:create, :update] do
      get :avatar, on: :member
    end
  end
end
