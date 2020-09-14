class HomeController < ApplicationController 
  # try to render a default view
  # views/controllername/index.html.erb

  def ok 
    render plain: "OK"
  end

  def index 
    # Query the DB
    @categories = Category.all.includes(:posts)
    @tags = Tag.all 
    
    @posts = Post.order_by_latest.published

  end

  def about 
  end

  def contact 
  end
end