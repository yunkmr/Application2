Rails.application.routes.draw do
  devise_for :user
  resources :users, only:[:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end

  root 'homes#top'
  get 'home/about' => 'homes#about'
end