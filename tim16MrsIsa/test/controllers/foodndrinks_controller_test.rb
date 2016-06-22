require 'test_helper'

class FoodndrinksControllerTest < ActionController::TestCase
  setup do
    @foodndrink = foodndrinks(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foodndrink" do
    assert_difference('Foodndrink.count') do
      post :create, foodndrink: { drink: @foodndrink.drink, food: @foodndrink.food, foodndrink_id: @foodndrink.foodndrink_id, user_id: @foodndrink.user_id, ResName: @foodndrink.ResName  }
    end

    assert_redirected_to foodndrink_path(assigns(:foodndrink))
  end

  test "should show foodndrink" do
    get :show, id: @foodndrink
    assert_response :success
  end

  test "should update foodndrink" do
    patch :update, id: @foodndrink, foodndrink: { drink: @foodndrink.drink, food: @foodndrink.food, foodndrink_id: @foodndrink.foodndrink_id, user_id: @foodndrink.user_id, ResName: @foodndrink.ResName }
    assert_redirected_to foodndrink_path(assigns(:foodndrink))
  end

  test "should destroy foodndrink" do
    assert_difference('Foodndrink.count', -1) do
      delete :destroy, id: @foodndrink
    end

    assert_redirected_to foodndrinks_path
  end
end
