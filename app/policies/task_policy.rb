class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user == user || record.milestone.guild.guildmemberships.where(user: user, admin: true).present?
  end

  def update?
    record.user == user || record.milestone.guild.guildmemberships.where(user: user).present?
  end
end
