class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    record.user == user #  || user.guildmembership.admin?
  end

  def update?
    record.user == user # || user.guildmembership.admin?
  end

  def destroy?
    record.user == user || record.guild.user == user
  end

  def new?
    record.guild.members.include?(user)
  end

  def create?
    new?
  end
end
