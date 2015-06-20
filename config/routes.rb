Rails.application.routes.draw do
  resources :machines do
    resources :turn_tables, only: [:new, :create]
    resources :articles, only: [:new, :create, :destroy] {

        member do
          delete :remove
        end
    }

    member do
      put :turn
    end

    member do
      get :service
    end

  end

  resources :activities, only: [:index]

  root 'machines#index'

end
