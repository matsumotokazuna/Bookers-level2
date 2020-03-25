Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#index'
  get '/homes/about' => 'homes#about'
  resources :books, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end