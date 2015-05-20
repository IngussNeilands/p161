require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "root get index" do
    assert_routing '/', controller: 'dashboard', action: 'index'
    assert_response :success
  end

end
