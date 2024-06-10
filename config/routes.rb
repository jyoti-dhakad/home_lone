Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  post 'login', to: "authentications#login"
  delete 'logout', to: 'authentications#logout'
  put 'change_password', to: "authentications#change_password"
  get 'current_user', to: 'current_users#index'
  resources :loans
  get 'approve_loans', to: 'loans#approve_loans'
  get 'read_enquiry', to: 'enquiries#read_enquiry'
  resources :contact_us
  resources :about_us

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

  namespace :admin do
    resources :users do
      member do
        put :approve
        put :cancel
      end
    end
  end
end
