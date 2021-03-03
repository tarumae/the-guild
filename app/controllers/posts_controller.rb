class PostsController < ApplicationController
  before_action :skip_authorization, only: [:index]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @guild = Guild.find(params[:guild_id])
    @posts = @guild.posts.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @guild = Guild.find(params[:guild_id])
    @post.guild = @guild
    authorize @post
  end
  
  def create
    @guild = Guild.find(params[:guild_id])
    @post = Post.new(post_params)
    @post.guild = @guild
    authorize @post
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to guild_path(@guild) 
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to guild_path(@post.guild)
    else
      render :edit
    end
  end
  
  def destroy
    @guild = @post.guild
    @post.destroy
    flash[:notice] = "Post successfully destroyed!"
    redirect_to guild_path(@post.guild)
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end
  

  def post_params
    params.require(:post).permit(:content)
  end
end
