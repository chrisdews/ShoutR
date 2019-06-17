class Shout < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :comments
  belongs_to :user

  def has_like?(user)
    self.likes.find_by(user_id: user.id)
  end
end
