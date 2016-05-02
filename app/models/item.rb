class Item < ActiveRecord::Base
  belongs_to :user
  validates :description, length: {minimum: 1}, presence: true
  default_scope {order "created_at DESC"}

  def days_left
     7 -(DateTime.now.to_date - created_at.to_date).to_i
  end
end
