class FavoritesController < ApplicationController

  def show
    @favorites = []
    @favorite = Favorite.find(params[:id])
    # @fav_restaurants = []
    # @@favorites.each do |f|
    #   @restaurant = Restaurant.find(restaurant_id: f.restaurant_id)
    #   @fav_restaurants << @restaurant
    # end
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(fav_params)

    if @favorite.save
      redirect_to :action => 'show', :id => @favorite
    else
      render :action => 'new'
    end
  end

  def fav_params
    params.require(:favorite).permit(:user_id, :restaurant_id)
  end

  def show_restaurants
    @restaurants = Restaurant.find(params[:id])
  end
end
