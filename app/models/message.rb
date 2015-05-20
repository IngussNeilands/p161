# message.rb
class Message < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  validates :owner_id, :body, presence: true, allow_nil: false, allow_blank: false
  validates :body, length: { maximum: 160 }

  before_validation :sanitize_input

  def sanitize_input
    body.gsub!(/\s/,'')
  end
end
