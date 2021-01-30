Rails.application.routes.draw do
  devise_for :users
  resources :todos

  get 'home/about'
  root 'home#index'

  # get 'search', to: "todos#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
