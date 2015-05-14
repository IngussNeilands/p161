require 'test_helper'

# message_test.rb
# A user can publish messages no longer than 160 characters.
class MessageTest < ActiveSupport::TestCase
  test "Empty message is invalid" do
    message = Message.new
    assert message.invalid?, "message must belong to user and have body"
    assert_includes message.errors.full_messages, "Body can't be blank"
    assert_includes message.errors.full_messages, "Owner can't be blank"
  end

  test "Message is invalid without user" do
    message = Message.new(:body => "Hello World!")
    assert message.invalid?, "message must belong to user"
    assert_includes message.errors.full_messages, "Owner can't be blank"
  end

  test "Message is invalid without a body" do
    message = Message.new(:owner => User.first)
    assert message.invalid?, message.errors.full_messages
    assert_includes message.errors.full_messages, "Body can't be blank"
  end

  test "Messages is no longer than 160 characters" do
    body = 'This text is supposed to be much much longer than 160 characters, so I keep typeing until I get so bored that I finally stop typing, but that hasn\'t been done yet.'
    message = Message.new(:owner => User.first,:body=> body)
    assert message.invalid?, 'message should be not longer than 160 characters'
  end

  test "A user can publish messages no longer than 160 characters" do
    assert User.first.publish("Hello world!")
  end

  test "A user can not publish messages longer than 160 characters" do
    body = 'This text is supposed to be much much longer than 160 characters, so I keep typeing until I get so bored that I finally stop typing, but that hasn\'t been done yet.'
    message = User.first.publish(body)
    assert message.invalid?, 'message should not be longer than 160 characters'
    assert_includes message.errors.full_messages, "Body is too long (maximum is 160 characters)"
  end
end
