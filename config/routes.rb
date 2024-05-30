Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  post 'login', to: "authentications#login"
  delete 'logout', to: 'authentications#logout'

  get 'current_user', to: 'current_users#index'
  resources :loans

  namespace :admin do
    resources :loan_applications do
      member do
        put :approve
        put :cancel
      end
    end
  end

  namespace :admin do
    resources :enquiries do
      member do
        put :Read
        
      end
    end
  end
  resources :enquiries
end
