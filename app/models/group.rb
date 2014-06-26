class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :users
  has_many :group_memberships
  has_many :group_images
  has_many :images, through: :group_images
end
