json.partial! "votes/vote", vote: @vote
# added the below line in an attempt to fix the issue mentioned in the votes#new html file
json.partial! "restaurants/restaurant", restaurant: @restaurant
