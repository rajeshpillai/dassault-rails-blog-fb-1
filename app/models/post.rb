
# One post record in the the DB -> Active Record Pattern
class Post < ApplicationRecord
  belongs_to :category
end


# @post = Post.new 

# @post.category
# posts table
#   category_id   (field)
