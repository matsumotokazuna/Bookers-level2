Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root :to => 'homes#index'
  get '/homes/about' => 'homes#about'
  resources :books, only: [:create]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end