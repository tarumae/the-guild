class GuildsController < ApplicationController
  before_action :set_guild, only: %i[show edit update destroy]
  def index
    @guilds = policy_scope(Guild)
  end

  def show; end

  def new
    @guild = Guild.new
    authorize @guild
  end

  def create
    @guild = Guild.new(guild_params)
    @guild.user = current_user
    authorize @guild
    if @guild.save
      flash[:notice] = "Guild successfully created!"
      redirect_to guild_path(@guild)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end

  def edit; end

  def update
    if @guild.update(guild_params)
      flash[:notice] = "Guild successfully updated!"
      redirect_to guild_path(@guild)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :edit
    end
  end

  private

  def set_guild
    @guild = Guild.find(params[:id])
    authorize @guild
  end

  def guild_params
    params.require(:guild).permit(:name, :description, :category)
  end
end
