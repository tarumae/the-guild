class UsersController < ApplicationController
  def index
    @guild = Guild.find(params[:guild_id])
    @users = policy_scope(User) - @guild.members
  end
end
