Rails.application.routes.draw do
  root 'workshops#index'
  devise_for :users

  resources :workshops, except: :delete do
    resources :registrations
  end
end
