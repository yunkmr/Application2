Rails.application.routes.draw do
  devise_for :user
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'homes#top'
  get 'home/about' => 'homes#about'
end