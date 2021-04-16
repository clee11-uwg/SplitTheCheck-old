class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
    @restaurants = Restaurant.search(params[:search])
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

  def addWontSplitVote
    @restaurant = Restaurant.find(params[:id])
    @restaurant.vote_down
    @restaurant.save
    respond_to do |format|
      format.html { redirect_to restaurants_path_path, notice: "Won't split count was successfully updated." }
    end
  end

  def search
    #@restaurants = Restaurant.search(params[:name])

    if params[:name].blank?
      redirect_to(restaurants_path_path, notice: "Empty field!") and return
    else
      @parameter = params[:name].downcase
      @restaurants = Restaurant.all.where("lower(name) LIKE :search", search: @parameter)
      respond_to do |format|
        format.html { redirect_to restaurants_path_path, notice: "Search completed" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :upVoteCount, :downVoteCount, :search)
    end
end
