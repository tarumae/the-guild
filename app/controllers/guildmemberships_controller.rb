class GuildmembershipsController < ApplicationController
  def index
    @memberships = policy_scope(Guildmembership).where(guild: params[:guild_id])
    @guild = Guild.find(params[:guild_id])
  end

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
    redirect_to manage_guild_path(@guild)
  end

  def update
    @membership = Guildmembership.find(params[:id])
    authorize @membership
    if @membership.update(admin: params[:admin], banned: params[:banned])
      flash[:notice] = "#{@membership.user.first_name} successfully updated!"
      redirect_to guild_guildmemberships_path(@membership.guild)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :index
    end
  end

  def status
    @membership = Guildmembership.find(params[:id])
    authorize @membership
    if @membership.update(status: params[:status])
      redirect_to guilds_path
    else
      flash[:alert] = "You have already accepted or rejected this invitation. Try refreshing the page."
    end
  end

  def destroy
    @membership = Guildmembership.find_by(guild: params[:guild_id], id: params[:id])
    authorize @membership
    if @membership.destroy
      if @membership.guild.user == current_user
        flash[:notice] = "#{@membership.user.full_name} has been kicked from the guild."
        redirect_to guild_guildmemberships_path(@membership.guild)
      elsif @membership.user == current_user
        redirect_to guilds_path
      end
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to guild_path(@membership.guild)
    end
  end
end
