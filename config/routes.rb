Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :workshops, except: :delete do
    resources :registrations
  end
end
