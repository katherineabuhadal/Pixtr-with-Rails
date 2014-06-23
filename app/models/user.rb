class User < ActiveRecord::Base
	has_many :galleries
  has_many :images, through: :galleries
	has_many :comments, through: :images

	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true
end
