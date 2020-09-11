class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]
  
  def index
    @tags = Tag.all 
  end

  def show 
    # @tag = Tag.find(params[:id])
  end

  def destroy 
    # @tag = Tag.find(params[:id])
    @tag.destroy 
    redirect_to tags_path
  end

  private 
  def set_tag 
    @tag = Tag.find(params[:id])
  end
end
