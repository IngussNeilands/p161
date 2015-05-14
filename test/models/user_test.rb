require 'test_helper'

# user_test.rb
# * A user can register using his email, a selected password and a user name. The user name has to be unique.
class UserTest < ActiveSupport::TestCase
  test 'A user can not register without data' do
    assert User.new.invalid?, 'user can register without data'
  end
  test 'A user can register using his email a selected password and a user name' do
    user = User.new(email: 'test@test.com', username: 'test2', password: 'test')
    assert user.valid?, user.errors.full_messages
  end
  test 'The user name has to be unique' do
    user = User.new(email: 'test@test.com', username: 'test', password: 'test')
    assert user.invalid?, 'username is not unique'
    assert_includes user.errors.full_messages, 'Username has already been taken'
  end
  test 'User has many messages' do
    user = users(:one)
    assert_respond_to user, :messages, 'user should have messages'
  end
  test 'User can follow another user' do
    user = users(:bela)
    user_to_follow = users(:two)
    assert user.follow(user_to_follow)
    activity = Activity.last
    assert_equal activity.user, user
    assert_equal activity.verb, 'followed'
    assert_equal Activity.last.subject, user_to_follow
  end
  test 'User has many followers' do
    user = users(:one)
    assert_respond_to user, :followers, 'user should have followers'
  end
  test 'Somebody you followed did something' do
    u1 = User.first
    u2 = User.second
    u1.follow(u2)
    message = u2.publish('Hello world!')
    assert u1.activity.where(subject_id: message).exists?, 'could not find activity'
  end
  test 'Somebody you are not following did something' do
    u1 = User.first
    u2 = User.second
    u1.follow(u2)
    message = u2.publish('Hello world!')
    assert u1.activity.where(subject_id: message).exists?, 'could not find activity'
  end
end
