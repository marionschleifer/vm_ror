Rails.application.routes.draw do
  resources :machines do
    resources :turn_tables, only: [:new, :create]
    resources :articles, only: [:new, :create, :destroy]

    member do
      put :turn
    end
  end

  root 'machines#index'

end
