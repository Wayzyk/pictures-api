Rails.application.routes.draw do
  namespace :v1 do
    resources :users, only: :create
    resources :pictures, only: [:index, :create] do
      collection do
        get '/:id/:filename', to: 'picture#render_scaled_picture', constraints: { filename: /scaled_.*/ },
          as: :scaled
        get '/:id/:filename', to: 'picture#render_original_picture'
        patch 'resize', to: 'picture#update'
      end
    end
  end
end
