class HomeController < ApplicationController 
  # try to render a default view
  # views/controllername/index.html.erb

  def ok 
    render plain: "OK"
  end

  def index 
    @posts = ["post 1", "post 2"]
  end

  def about 
  end

  def contact 
  end
end