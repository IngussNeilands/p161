require 'test_helper'

# users_controller_test.rb
class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = users(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, password: @user.password, username: @user.username + '1' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test 'should not create user' do
    assert_no_difference('User.count') do
      post :create, user: { email: @user.email, password: @user.password, username: @user.username }
    end

    assert_response :success
  end

  test 'should show user' do
    get :show, id: @user
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @user
    assert_response :success
  end

  test 'should update user only if username is unique' do
    patch :update, id: @user, user: { email: @user.email, password: @user.password, username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
