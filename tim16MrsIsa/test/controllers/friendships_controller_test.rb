require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  setup do
    @friendship = friendships(:one)
  end

  test "should create friendship" do
    assert_difference('Friendship.count') do
      post :create, friendship: { friend_id: @friendship.friend_id, user_id: @friendship.user_id }
    end

    assert_redirected_to friendship_path(assigns(:friendship))
  end

  test "should destroy friendship" do
    assert_difference('Friendship.count', -1) do
      delete :destroy, id: @friendship
    end

    assert_redirected_to friendships_path
  end
end
