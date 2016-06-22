require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Should not save user with existing email and different passwords" do
  user = User.new
  assert_not user.save, "Saved the user with existing email and different passwords"
  end
  

end
