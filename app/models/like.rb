class Like < ApplicationRecord
  belongs_to :shout
  belongs_to :comment
  belongs_to :user
end
