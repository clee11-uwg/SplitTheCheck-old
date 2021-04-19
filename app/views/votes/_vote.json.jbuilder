json.extract! vote, :id, :created_at, :updated_at
json.extract! restaurant, :id, :name, :address, :city, :state, :zip, :upVoteCount, :downVoteCount, :created_at, :updated_at
json.url vote_url(vote, format: :json)
