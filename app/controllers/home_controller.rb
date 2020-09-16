class HomeController < ApplicationController 
  # try to render a default view
  # views/controllername/index.html.erb

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
    @post = Post.find(params[:id])
    
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
end