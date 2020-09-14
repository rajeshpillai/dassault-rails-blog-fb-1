
# One post record in the the DB -> Active Record Pattern
class Post < ApplicationRecord
  belongs_to :category

  # default scope
  default_scope { order :created_at}

  scope :published, -> { where(published: true)}
  scope :unpublished, -> { where.not(published: true)}

  # Override default scope (reorder)
  scope :order_by_latest, -> { reorder(created_at: :desc)}

end


# @post = Post.new 

# @post.category
# posts table
#   category_id   (field)
