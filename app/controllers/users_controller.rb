class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @votes = Vote.where(user_id: @user.user_id)
    @votes.each do |v|
      @restaurants = Restaurant.where(restaurant_id: v.restaurant_id)
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = user.new(user_params)

    if @user.save
      redirect_to :action => 'show', :id => @user
    else
      @restaurants = Restaurant.all
      render :action => 'new'
    end
  end

  def user_params
    params.require(:user).permit(:id, :email, :encrypted_password)
  end

  def edit
    @user = User.find(params[:id])
    @restaurants = Restaurant.all
    @votes = Vote.all
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to :action => 'show', :id => @user
    else
      @restaurants = Restaurant.all
      render :action => :edit
    end
  end

  def show_restaurants
    @restaurants = Restaurant.find(params[:id])
  end
end
