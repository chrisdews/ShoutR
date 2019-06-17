class Comment < ApplicationRecord
  has_many :likes, as: :likeable
  belongs_to :shout
  belongs_to :user
end
