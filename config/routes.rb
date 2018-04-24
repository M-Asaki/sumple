Rails.application.routes.draw do

  get 'favorites/index'
  get 'topics/new'
  get 'topics/index'
  get 'users/new'

  root 'pages#index'

  get 'pages/help'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources 'users'

  resources :topics do
    post 'comments', to: 'comments#create'
  end

  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
