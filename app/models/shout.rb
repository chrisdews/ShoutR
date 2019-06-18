class Shout < ApplicationRecord
  has_many :likes, as: :likeable, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :user

  def has_like?(user)
    self.likes.find_by(user_id: user.id)
  end

  def is_author?(user)
    self.user_id == user.id
  end

  def self.is_my_shout?(userid)
    Shout.select{ |shout| shout.user_id == userid }
  end
end
