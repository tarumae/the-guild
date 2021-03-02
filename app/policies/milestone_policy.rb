class MilestonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    record.user == user || record.guild_users.where(user: user).present?
  end

  def create?
    true
  end

  def new?
    # checking if user is admin
    # user.guild_user.admin
    true
  end
end
