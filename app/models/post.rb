
# One post record in the the DB -> Active Record Pattern
class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :comments 
  has_rich_text :body


  # default scope
  default_scope { order :created_at}

  scope :published, -> { where(published: true)}
  scope :unpublished, -> { where.not(published: true)}

  # Override default scope (reorder)
  scope :order_by_latest, -> { reorder(created_at: :desc)}

  attr_accessor :all_tags
  
  # new and update
  after_save :assign_tags

  def assign_tags 
    if @all_tags.blank?
      return
    end
    # tag_names: => tag1, tag2, tag3
    # NOTE: DO NOTE USE all_tags below as it will call getter
    #       USE @all_tags
    self.tags = @all_tags.split(",").map do |tag_name|
       unless tag_name.blank?
          Tag.where(name: tag_name.strip).first_or_create!
       end
    end
  end

  # Custom/virtual methods for fields
  # def all_tagsx=(names)
  #   p "all_tags: #{names}"
  #   if names.blank?
  #     return
  #   end
  #   # tag_names: => tag1, tag2, tag3
  #   self.tags = names.split(",").map do |tag_name|
  #      unless tag_name.blank?
  #         Tag.where(name: tag_name.strip).first_or_create!
  #      end
  #   end
  # end

  def all_tags 
    tags.map(&:name).join(", ")
  end

  # Post body

  def post_body 
    self.body.body
  end
end
