require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "root get index" do
    assert_routing '/', controller: 'dashboard', action: 'index'
    assert_response :success
  end

end
