class User < ApplicationRecord
    has_many :shouts
    has_many :comments, through: :shouts
    has_many :likes, through: :shouts
    has_many :likes, through: :comments

    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
end
