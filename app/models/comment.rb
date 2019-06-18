class Comment < ApplicationRecord
  has_many :likes, as: :likeable, :dependent => :destroy
  belongs_to :shout
  belongs_to :user

  def has_like?(user)
    self.likes.find_by(user_id: user.id)
  end

  def is_author?(user)
    self.user_id == user.id
  end

end
