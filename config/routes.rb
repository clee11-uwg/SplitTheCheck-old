Rails.application.routes.draw do
  root 'restaurants#index', as: 'restaurants_path'

  put 'restaurants/:id/addWillSplitVote', to: 'restaurants#addWillSplitVote', as: 'up_vote'
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
