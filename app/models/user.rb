class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries
  has_many :comments, through: :images
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :likes
  has_many :liked_groups, through: :likes, source: :group
  has_many :liked_images, through: :likes, source: :image

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def member?(group)
    group_ids.include?(group.id)
    # GroupMembership.where(group_id: group.id, user_id: self.id).size > 0
  end

  def join(group)
    groups << group
  end

  def leave(group)
    groups.destroy(group)
  end

  def like(likeable)
    likes.create(likeable: likeable)
  end

  def like?(likeable)
    Like.exists?(likeable: likeable)
  end

  def unlike(likeable)
    likes.find_by(likeable: likeable).destroy
  end

end
