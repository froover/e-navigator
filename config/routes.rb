Rails.application.routes.draw do
  devise_for :users
  resources :interviews

  root 'users#index'
  get 'users/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
