Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  devise_scope :user do
    get "users/sign_in", :to => "users/sessions#new"
    get "users/sign_out", :to => "users/sessions#destroy" 
  end
  root :to => 'home#index'
  get '/home/about' => 'home#about'
  get 'books' => 'books#index'
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end