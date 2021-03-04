class MilestonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.guild.user == user || record.guild.guildmemberships.where(user: user).present?
  end

  def create?
    # checking if user is admin
    record.guild.user == user || record.guild.guildmemberships.where(user: user, admin: true).present?
  end

  def new?
    # checking if user is admin
    record.guild.user == user || record.guild.guildmemberships.where(user: user, admin: true).present?
  end

  def update?
    # checking if user is admin
    record.guild.user == user || record.guild.guildmemberships.where(user: user, admin: true).present?
  end

  def destroy?
    # checking if user is admin
    record.guild.user == user || record.guild.guildmemberships.where(user: user, admin: true).present?
  end
end
