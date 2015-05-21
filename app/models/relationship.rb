# relationship.rb
class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower, :followed, presence: true
  validates_uniqueness_of :follower, scope: [:follower, :followed], message: 'already following.'
end
