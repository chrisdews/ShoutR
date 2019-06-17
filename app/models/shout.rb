class Shout < ApplicationRecord
  has_many :likes, as: :likeobject
  belongs_to :user
end
