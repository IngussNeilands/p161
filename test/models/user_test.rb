require 'test_helper'

# user_test.rb
# * A user can register using his email, a selected password and a user name

class UserTest < ActiveSupport::TestCase
  test "A user can not register without data" do
    assert User.new.invalid?, "user can register without data"
  end
  test "A user can register using his email a selected password and a user name" do
    assert User.new(email: 'test@test.com', username: 'test', password: 'test').valid?
  end
end
