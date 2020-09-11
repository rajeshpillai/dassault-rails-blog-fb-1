class HomeController < ApplicationController 
  # try to render a default view
  # views/controllername/index.html.erb

  def ok 

    render plain: "OK"
  end

  def index 
    
  end

  def about 
  end

  def contact 
  end
end