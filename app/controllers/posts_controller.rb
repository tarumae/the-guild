class PostsController < ApplicationController
  before_action :skip_authorization, only: [:new, :create]

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end
  
  def update
    
  end

  def destroy
  
  end

  private

  def post_params
    params.require(:guild).permit(:desription)
  end
end
