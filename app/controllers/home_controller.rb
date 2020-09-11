class HomeController < ApplicationController 
  def ok 
    # nil
    # try to render a default view
    # views/controllername/index.html.erb

    render plain: "OK"
  end

  def index 
    render plain: "This is index page"
  end
end