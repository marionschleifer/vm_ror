Rails.application.routes.draw do
  resources :machines do
    member do
      put :turn
      get :service
    end

    resources :turn_tables, only: [:new, :create]
    resources :articles, only: [:new, :create, :destroy] do
      member do
        delete :remove
      end
    end
  end

  resources :activities, only: [:index]

  root 'machines#index'
end
