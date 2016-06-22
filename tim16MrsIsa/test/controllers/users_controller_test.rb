require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end
  
  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation, ime: @user.ime , prezime: @user.prezime , adresa: @user.adresa }
    assert_response :success
  end
end
