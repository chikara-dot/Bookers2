Rails.application.routes.draw do
   devise_for :users
  root to: 'homes#top'

  get 'home/about' => 'homes#about'
  resources :users, only: [:index,:show,:edit,:create,:new,:update]

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end


  resources :relationship, onlu: [:create, :destroy]

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  get 'follows/:id' => 'relationships#follows', as: 'follows'
  get 'followers/:id' => 'relationships#followers', as: 'followers'

  get 'search' => 'search#search', as: 'search'


end
