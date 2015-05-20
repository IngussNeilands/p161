require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:one)
  end

  test "should get new if user is not loged in" do
    session[:user_id] = nil
    get :new
    assert_response :success
  end

  test "should redirect to root if user is loged in" do
    get :new
    assert_redirected_to root_path
  end

  test "should create new" do
    @user = users(:one)
    post :create, login: { password: @user.password, username: @user.username }

    assert session[:user_id], User.find_by_username_and_password(@user.username, @user.password).id
    assert_redirected_to root_path
  end

  test "should delete session" do
    delete :destroy, id: 1
    assert_redirected_to new_session_path
    assert_equal flash[:notice], 'Good bye!'
  end

end
