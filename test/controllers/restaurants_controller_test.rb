require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { address: @restaurant.address, city: @restaurant.city, downVoteCount: @restaurant.downVoteCount, name: @restaurant.name, state: @restaurant.state, upVoteCount: @restaurant.upVoteCount, zip: @restaurant.zip } }
    end

    assert_redirected_to restaurants_path_path
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { address: @restaurant.address, city: @restaurant.city, downVoteCount: @restaurant.downVoteCount, name: @restaurant.name, state: @restaurant.state, upVoteCount: @restaurant.upVoteCount, zip: @restaurant.zip } }
    assert_redirected_to restaurants_path_path
  end

end
