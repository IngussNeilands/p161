require 'test_helper'

class SessionControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    @user = users(:one)
    post :create, login: { password: @user.password, username: @user.username }

    assert session[:user_id], User.find_by_username_and_password(@user.username, @user.password).id
    assert_redirected_to root_path
  end

  test "should get destroy" do
    delete :destroy
    assert_redirected_to new_session_path
    assert_equal flash[:notice], 'Good bye!'
  end

end
