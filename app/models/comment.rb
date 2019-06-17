class Comment < ApplicationRecord
  has_many :likes, as: :likeobject
  belongs_to :shout
  belongs_to :user
end
