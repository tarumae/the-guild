class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?  
    record.user == user #  || user.guild_user.admin? 
  end

  def update?
    record.user == user # || user.guild_user.admin?
  end

  def destroy?
    record.user == user # || user.guild_user.admin?
  end

  def new?
    false
  end
  
end
