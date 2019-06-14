class User < ApplicationRecord
    has_many :shouts
    has_many :likes, through: :shouts
    has_many :comments, through: :shouts
end
