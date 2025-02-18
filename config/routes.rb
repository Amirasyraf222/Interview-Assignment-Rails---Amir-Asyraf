Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :car_batteries, only: [:index] do
    collection do
      post 'create', to: 'car_batteries#create'
    end
    member do
      get 'view', to: 'car_batteries#show'
      put 'update', to: 'car_batteries#update'
      delete 'delete', to: 'car_batteries#destroy'
    end
  end
end
