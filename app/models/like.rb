class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeobject, polymorphic: true
end
