class Shout < ApplicationRecord
  has_many :likes, as: :likeable, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :user

  def has_like?(user)  ### Create Module for this
    self.likes.find_by(user_id: user.id)
  end

  def is_author?(user) ### Create Module for this
    self.user_id == user.id
  end

  def self.is_my_shout?(userid)
    Shout.select{ |shout| shout.user_id == userid }
  end

  def self.sort_and_filter params
    shouts = params[:user_filter] ? Shout.where(user_id: params[:user_filter]) : Shout.all
    shouts
  end

  def time_mark  ### Create Module for this
    if ((Time.now - self.created_at) / 3600) > 24 # Show days
    "#{((Time.now - self.created_at) / 3600 / 24).floor}d"
    elsif ((Time.now - self.created_at) / 3600) > 1
      "#{((Time.now - self.created_at) / 3600).floor}h"
    elsif ((Time.now - self.created_at) / 60) > 1 # Show minutes
      "#{((Time.now - self.created_at) / 60).floor}m"
    else ((Time.now - self.created_at) / 60) < 1 # Show seconds
      "#{(Time.now - self.created_at).floor}s"
    end
  end

end
