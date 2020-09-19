module Api
  class PostsController < ActionController::API
    respond_to :json
    def index 
      @posts = Post.all
      render json: @posts
    end

    def show
      @post = Post.find(params[:id])
      render json: @post
    end

    def create
      puts "Creating new post...#{params[:post]}"
      @post = Post.new(post_params)

      if @post.save
         render json: @post, status: :created, location: @post 
      else
         render json: @post.errors, status: :unprocessable_entity 
      end
    
    end

    private 
    def post_params
      params.require(:post)
            .permit(:title, :body, :user_id, :published, :category_id, :all_tags, tag_ids:[])
    end

  end
end