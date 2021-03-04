class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.milestone.guild.user == user || record.milestone.guild.guildmemberships.where(user: user, admin: true).present?
  end

  def update?
    record.milestone.guild.user == user || record.milestone.guild.guildmemberships.where(user: user).present?
  end
end
