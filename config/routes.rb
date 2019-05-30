Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  root to:'home#index'
  get 'home/about', to: 'home#about', as: 'home_about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
