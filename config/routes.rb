Rails.application.routes.draw do
  namespace :v1 do
    resource :users, only: :create
    resource :pictures
  end
end
