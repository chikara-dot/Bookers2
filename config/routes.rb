Rails.application.routes.draw do
   devise_for :users
  root to: 'homes#top'

  get 'home/about' => 'homes#about'
  resources :users, only: [:index]
  resources :books, only: [:new, :create, :index, :show, :destroy]
  get 'book/edit' => 'books#edit'
  get 'book/index' => 'books#index'
end
