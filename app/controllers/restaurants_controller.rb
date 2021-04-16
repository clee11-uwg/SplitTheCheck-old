class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurants_path_path, notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurants_path_path, notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def addWillSplitVote
    @restaurant = Restaurant.find(params[:id])
    @restaurant.vote_up
    @restaurant.save
    respond_to do |format|
        format.html { redirect_to restaurants_path_path, notice: "Will split count was successfully updated." }
    end
  end
  #
  # # I am not sure where or how to implement the logic needed in order to increase the upVoteCount by 1
  # def addWontSplitVote
  #   respond_to do |format|
  #     format.html { redirect_to restaurants_path_path, notice: "Won't split count was successfully updated." }
  #   end
  # end

  def search
    if params[:search].blank?
      redirect_to(restaurants_path_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Store.all.where("lower(name) LIKE :search", search: @parameter)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :upVoteCount, :downVoteCount)
    end
end
