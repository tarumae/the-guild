class GuildsController < ApplicationController
  before_action :set_guild, only: %i[show edit update destroy manage]
  def index
    @guilds = policy_scope(Guild)
  end

  def show
    @post = Post.new
    @posts_with_pictures = @guild.posts.select { |post| post.attachments? }
  end

  def new
    @guild = Guild.new
    authorize @guild
  end

  def create
    @guild = Guild.new(guild_params)
    @guild.user = current_user
    authorize @guild
    if @guild.save
      flash[:notice] = "#{@guild.name} successfully created!"
      redirect_to guild_path(@guild)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end

  def edit; end

  def update
    if @guild.update(guild_params)
      flash[:notice] = "#{@guild.name} successfully updated!"
      redirect_to guild_path(@guild)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :edit
    end
  end

  def manage; end

  def destroy
    if @guild.guildmemberships.empty?
      if @guild.destroy
        flash[:notice] = "#{@guild.name} has successfully been deleted"
        redirect_to guilds_path
      end
    else
      flash[:alert] = "Can not delete a guild that has members. Please remove all the members and try again."
      render :manage
    end
  end

  private

  def set_guild
    @guild = Guild.find(params[:id])
    authorize @guild
  end

  def guild_params
    params.require(:guild).permit(:name, :description, :category, :photo)
  end
end
