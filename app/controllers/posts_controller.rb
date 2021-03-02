class PostsController < ApplicationController
  before_action :skip_authorization, only: [:index, :new, :create]

  def index
    @guild = Guild.find(params[:guild_id])
    @posts = @guild.posts
  end

  def new
    @post = Post.new
    @guild = Guild.find(params[:guild_id])
    # authorize @post
  end
  
  def create
    @guild = Guild.find(params[:guild_id])
    @post = Post.new(post_params)
    @post.user = current_user
    # authorize @post
    if @post.save
      # flash[:notice] = "Post successfully created!"
      redirect_to guild_posts_path(@guild) #ask Lenny guild_posts_path(@post)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    
  end
  
  def destroy
    @post = Post.find(params[:id]) # do we need this?
    authorize @post
    @post.destroy
    flash[:notice] = "Post successfully destroyed!"
    redirect_to guild_path(@guild)
  end

  private

  def post_params
    params.require(:post).permit(:description)
  end
end
