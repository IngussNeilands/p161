# user.rb
class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :active_relationships, foreign_key: :following
  has_many :following, through: :active_relationships, source: :followed

  has_many :messages, inverse_of: :owner, foreign_key: :owner_id

  has_many :activities
  has_many :references, class_name: 'Activity', foreign_key: :subject_id

  after_create :create_activities

  def publish(message)
    messages.create(body: message)
  end

  def follow(user_to_follow)
    active_relationships.create(followed: user_to_follow)
  end

  # def followers
  #  User.where(id: Activity.where(subject_id: id).map(&:user_id))
  # end

  # def follow(user_to_follow)
  #  activities.create({verb: 'followed',subject: user_to_follow})
  # end

  # def following
  #  User.where(id: activities.where(verb: 'followed').map(&:subject_id))
  # end

  def create_activities
    activities.create(verb: 'signed up', subject: self)
  end

  def activity
    Activity.where(user_id: following_ids)
  end
end
