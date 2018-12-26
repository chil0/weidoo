Rails.application.routes.draw do
  devise_for :users
  get 'chirps', :to => 'chirps#index', :as => :user_root
  get 'chirps/photo' => 'chirps#photo'

  resources :users
  resources :chirps
  root :to => 'chirps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
