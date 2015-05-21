require 'test_helper'

# relationship_test.rb
class RelationshipTest < ActiveSupport::TestCase
  test 'should validate both ends' do
    assert Relationship.new.invalid?, 'should be invalid'
  end

  test 'should be unique' do
    user1 = users(:one)
    user2 = users(:two)
    Relationship.create(follower: user1, followed: user2)
    relationship2 = Relationship.new(follower: user1, followed: user2)
    assert relationship2.invalid?, 'relationship should be unique'
    assert_includes relationship2.errors.full_messages, 'Follower already following.'
  end
end
