class HomeController < ApplicationController 
  before_action :authenticate_user!, only: [:comments]

  def ok 
    render plain: "OK"
  end

  def index 
    # Query the DB
    @categories = Category.all.includes(:posts)
    @tags = Tag.includes(:posts) 
    
    @posts = Post
              .includes(:tags)
              .published.order_by_latest
              .page(params[:page]).per(5)

  end

  def read 
    @post = Post.includes(:comments, :user).find(params[:id])
  end

  # POST /home/comments/:post_id
  def comments
    # Get the commented Post model
    @post = Post.find(params[:post_id])

    # Create a new comment based on form submit
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user   # devise gives current_model (here current_user)
    @comment.save 

    redirect_to post_read_path(@post)

  end

  # Search from text box 
  def search 
    # todo 
    q = params[:q]

    # % for contains search
    @posts = Post.where('title LIKE ?', "%#{q}%").page(params[:page]).per(5)

    render "home/index"

  end

  def tag_search

    if params.has_key? (:tag)
      # @posts = Tag.find_by(:name => params[:tag]).posts
      
      result = Tag.where(name: params[:tag])
      @posts = result.blank? ? [] : result.first.posts.page(params[:page]).per(5)

    end

    render "home/index"
  end

  def category_search 
    if params.has_key? (:category_slug)
      # @posts = Tag.find_by(:name => params[:tag]).posts
      
      result = Category.where(slug: params[:category_slug])
      @posts = result.blank? ? [] : result.first.posts.page(params[:page]).per(5)

    end

    render "home/index"
  end

  def about 
  end

  def contact 
  end

  private

  def comment_params 
    params.require(:comment).permit(:title, :content)
  end
end