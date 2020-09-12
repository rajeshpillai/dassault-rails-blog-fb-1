class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy, :edit, :update]
  
  def index
    @tags = Tag.all 
  end

  def show 
    # @tag = Tag.find(params[:id])
  end

  def new 
    @tag = Tag.new
  end

  def edit 
    
  end


  # POST /tags
  def create
    p params
    # @tag = Tag.new(params)  # permission error
    @tag = Tag.new(tag_params)

    if @tag.save
      # PRG => Post - Do a Redirect -> To make a GET request
      redirect_to tags_path, notice: "Tag was successfully created!"
    else 
      render :new
    end
  end

  # PATCH/PUT /tags/:id
  def update 
    # UPDATE tags set name = "name" where id = :id
    if @tag.update(tag_params) 
      redirect_to tags_path, notice: "Tag was successfully updated!"
    else 
      render :edit
    end
  end

  def destroy 
    # @tag = Tag.find(params[:id])
    # byebug
    @tag.destroy 
    redirect_to tags_path, notice: "Tag was successfully deleted."
  end

  private 
  
  def set_tag 
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
