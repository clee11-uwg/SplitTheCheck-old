json.extract! restaurant, :id, :name, :address, :city, :state, :zip, :upVoteCount, :downVoteCount, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
