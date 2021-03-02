class PostsController < ApplicationController
  before_action :skip_authorization, only: [:new, :create]
  
  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    
  end

  def create
    
  end
  
  def update
    
  end

  def destroy
  
  end
end
