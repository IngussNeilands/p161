class User < ActiveRecord::Base
  validates :username, :email, :password, :presence => true
  validates :username, :uniqueness => true

  has_many :messages, :inverse_of => :owner, :foreign_key => :owner_id

  def publish(message)
    messages.create(body: message)
  end
end
