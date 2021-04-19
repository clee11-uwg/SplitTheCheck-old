Rails.application.routes.draw do
  resources :votes
  devise_for :users
  root 'restaurants#index', as: 'restaurants_path'

  put 'restaurants/:id/addWillSplitVote', to: 'restaurants#addWillSplitVote', as: 'up_vote'

  put 'restaurants/:id/addWontSplitVote', to: 'restaurants#addWontSplitVote', as: 'down_vote'

  get 'restaurants/search', to: 'restaurants#search', as: 'search'
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
