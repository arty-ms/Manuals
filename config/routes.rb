Rails.application.routes.draw do
  
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  get 'start_page/index'
  root 'start_page#index'
  resources :posts do
  	resources :comments
  end
  resources :start_page
  post 'uploadfiles'=>'posts#upload'
  resources :picture, only: [:create]
  resources :messages, only: [:new]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
