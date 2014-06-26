class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments

  has_many :likes
  has_many :group_images
  has_many :groups, through: :group_images

  has_many :taggings
  has_many :tags, through: :taggings

  validates :url, presence: true
  validates :gallery, presence: true

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(new_tag_name_list)
    tag_names = new_tag_name_list.split(", ")
    new_tags = tag_names.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end

    self.tags = new_tags
  end
end
