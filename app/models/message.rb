# message.rb
class Message < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  validates :owner_id, :body, presence: true, allow_nil: false, allow_blank: false
  validates :body, length: { maximum: 160 }

  after_create :create_activities

  def create_activities
    Activity.create(user: owner, verb: 'published', subject: self)
  end
end
