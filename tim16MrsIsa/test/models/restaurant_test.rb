require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "Should not save restaurant without a name" do
  restaurant = Restaurant.new
  assert_not restaurant.save, "Saved the restaurant without a name"
  end
end
