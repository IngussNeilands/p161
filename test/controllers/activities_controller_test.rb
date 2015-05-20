require 'test_helper'

# activities_controller_test.rb
class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:follow)
    session[:user_id] = users(:one).id
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create activity' do
    assert_difference('Activity.count') do
      post :create, activity: { user_id: @activity.user_id, subject_id: @activity.subject_id, subject_type: @activity.subject_type, verb: @activity.verb }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test 'should show activity' do
    get :show, id: @activity
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @activity
    assert_response :success
  end

  test 'should update activity' do
    patch :update, id: @activity, activity: { user: @activity.user, subject: @activity.subject, subject_type: @activity.subject_type, verb: @activity.verb }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test 'should destroy activity' do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    assert_redirected_to activities_path
  end
end
