class GuildmembershipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.guild.user == user
  end

  def update?
    record.guild.user == user || record.guild.guildmemberships.where(user: user, admin: true).present? || record.user == user
  end

  def status?
    record.user == user
  end

  def destroy?
    record.user == user || record.guild.user == user || record.guild.guildmemberships.where(user: user, admin: true).present?
  end
end
