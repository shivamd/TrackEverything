TrackAnything::Application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  get 'profile' => 'users#show', as: 'current_user'
  
  resources :topics
end
