Rails.application.routes.draw do
  resources :votes
  devise_for :users
  root 'restaurants#index', as: 'restaurants_path'

  put 'restaurants/:id/addWillSplitVote/:user_id', to: 'restaurants#addWillSplitVote', as: 'up_vote'

  put 'restaurants/:id/addWontSplitVote', to: 'restaurants#addWontSplitVote', as: 'down_vote'

  get 'restaurants/search', to: 'restaurants#search', as: 'search'

  get 'user/:id', to: 'users#show', as: 'user'
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
