# relationship.rb
class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create :create_activities

  def create_activities
    Activity.create(user: follower, verb: 'followed', subject: followed)
  end
end
