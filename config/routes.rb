Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :workshops, only: [:new, :create, :show] do
    resources :registrations
  end


end
