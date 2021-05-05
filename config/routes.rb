Rails.application.routes.draw do
  resources :votes
  devise_for :users
  root 'restaurants#index', as: 'restaurants_path'

  put 'votes/create/:vote/:user_id/:restaurant_id', to: 'votes#create', as: 'up_vote'

  put 'votes/create/:vote/:user_id/:restaurant_id', to: 'votes#create', as: 'down_vote'

  get 'restaurants/search', to: 'restaurants#search', as: 'search'

  get 'user/:id', to: 'users#show', as: 'user'
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
