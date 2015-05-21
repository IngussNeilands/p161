# user.rb
class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true

  has_many :messages, inverse_of: :owner, foreign_key: :owner_id

  has_many :relationships, foreign_key: :follower_id
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id

  has_many :followings, class_name: 'User', through: 'relationships', source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  def publish(message)
    messages.create(body: message)
  end
end
