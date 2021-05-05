class FavoritesController < ApplicationController
  def show
    @favs = @@favorites
    # @fav_restaurants = []
    # @@favorites.each do |f|
    #   @restaurant = Restaurant.find(restaurant_id: f.restaurant_id)
    #   @fav_restaurants << @restaurant
    # end
  end

  def self.get_vote_by_rest_id(id)
    @my_votes = @@votes.where(restaurant_id: id)
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @@favorites = []
    @favorite = Favorite.new(fav_params)
    @@favorites << @favorite
    if @favorite.save
      redirect_to :action => 'show'
    else
      render :action => 'new'
    end
  end

  def fav_params
    params.permit(:user_id, :restaurant_id)
  end

  def show_restaurants
    @restaurants = Restaurant.find(params[:id])
  end
end
