Rails.application.routes.draw do
  resources :appointments
  devise_for :users
  resources :patients
  #get 'home/index'
  get 'home/contactUs'
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
