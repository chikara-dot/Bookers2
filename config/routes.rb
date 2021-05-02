Rails.application.routes.draw do
   devise_for :users
  root to: 'homes#top'

  get 'home/about' => 'homes#about'
  resources :users, only: [:index,:show,:edit,:create,:new,:update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

end
