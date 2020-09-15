
# One post record in the the DB -> Active Record Pattern
class Post < ApplicationRecord
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  # default scope
  default_scope { order :created_at}

  scope :published, -> { where(published: true)}
  scope :unpublished, -> { where.not(published: true)}

  # Override default scope (reorder)
  scope :order_by_latest, -> { reorder(created_at: :desc)}

  # Custom/virtual methods for fields
  def all_tags=(names)
    p "all_tags: #{names}"
    if names.blank?
      return
    end
    # tag_names: => tag1, tag2, tag3
    self.tags = names.split(",").map do |tag_name|
       unless tag_name.blank?
          Tag.where(name: tag_name.strip).first_or_create!
       end
    end
  end

  def all_tags 
    tags.map(&:name).join(", ")
  end
end
