Rails.application.routes.draw do
  get 'comments/index'
  put 'comments/search'

  get 'search_chirps/index'
  put 'search_chirps/search'

  get "find_friends/index"
  put "find_friends/search"

  put "follows/follow/:id" => "follows#follow", :as => 'follows_follow'
  put "follows/cancel/:id" => "follows#cancel", :as => 'follows_cancel'
  get 'follows/list'

  get 'chat/index'
  post 'chat/index'

  put "faces/update" => "faces#update"
  get 'faces/register'

##  get "users/face" => "users#face"
#  put "faces/register"

  devise_for :users
  resources :users do
    get 'face', to: 'users#face', on: :collection
  end

  ##get "chirps/face" => "chirps#face"
  ##get 'chirps', :to => 'chirps#index', :as => :user_root
  ##get 'chirps/photo' => 'chirps#photo'
    get 'chirps', :to => 'chirps#index', :as => :user_root

  resources :chirps do
    get 'face', to: 'chirps#face', on: :collection
    get 'photo', to: 'chirps#photo', on: :collection
    resources :comments
  end
  root :to => 'chirps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
