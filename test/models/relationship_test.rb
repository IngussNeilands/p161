require 'test_helper'

# relationship_test.rb
class RelationshipTest < ActiveSupport::TestCase
  test 'is valid' do
    r = Relationship.new(follower: User.first, followed: User.last)
    assert r.valid?, r.errors.full_messages
  end
end
