class GuildsController < ApplicationController
  def new
    @guild = Guild.new
    authorize @guild
  end

  def create
    @guild = Guild.new(guild_params)
    @guild.user = current_user
    authorize @guild
    if @guild.save
      flash[:notice] = "Guild successfully created"
      redirect_to guild_path(@guild)
    else
      flash[:alert] = "Something went wrong. Please try again"
      render :new
    end
  end

  private

  def guild_params
    params.require(:guild).permit(:name, :description, :category)
  end
end
