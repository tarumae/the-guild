class GuildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.all_guilds
    end
  end

  def create?
    true
  end

  def show?
    record.user == user || record.guildmemberships.where(user: user).present?
  end
end
