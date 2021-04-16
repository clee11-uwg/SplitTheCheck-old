Rails.application.routes.draw do
  root 'restaurants#index', as: 'restaurants_path'

  put 'restaurants/:id/addWillSplitVote', to: 'restaurants#addWillSplitVote', as: 'up_vote'

  put 'restaurants/:id/addWontSplitVote', to: 'restaurants#addWontSplitVote', as: 'down_vote'
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
