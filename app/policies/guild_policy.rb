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

  def update?
    check_admin?
  end

  def manage?
    check_admin?
  end

  def destroy?
    check_admin?
  end

  private

  def check_admin?
    record.user == user || record.guildmemberships.where(user: user, admin: true).present?
  end
end
