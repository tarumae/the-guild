class UsersController < ApplicationController
  def index
    @guild = Guild.find(params[:guild_id])
    if params[:query].present?
      @users = policy_scope(User).search_by_name_nickname_and_email(params[:query]) - @guild.members
    else
      @users = policy_scope(User) - @guild.members
    end
  end
end
