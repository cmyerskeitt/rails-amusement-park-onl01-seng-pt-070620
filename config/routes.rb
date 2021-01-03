Rails.application.routes.draw do
  root 'static#home'
  resources :users
  resources :attractions
  patch 'attractions/:id', to: 'attractions#update'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/rides', to:"rides#create", as: 'rides'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
