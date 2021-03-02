class GuildsController < ApplicationController
  def index
    @guilds = policy_scope(Guild)
  end

  def show
    @guild = Guild.find(params[:id])
    authorize @guild
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
      flash[:notice] = "Guild successfully created!"
      redirect_to guild_path(@guild)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end

  private

  def guild_params
    params.require(:guild).permit(:name, :description, :category)
  end
end
