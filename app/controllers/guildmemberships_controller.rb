class GuildmembershipsController < ApplicationController
  def create
    @user = User.find(params[:user])
    @guild = Guild.find(params[:guild_id])
    @membership = Guildmembership.new
    @membership.user = @user
    @membership.guild = @guild
    authorize @membership
    if @membership.save
      flash[:notice] = "#{@user.first_name} successfully invited"
    else
      flash[:alert] = "Can not invite. User has already been invited to the guild"
    end
    redirect_to guild_users_path(@guild)
  end
end
