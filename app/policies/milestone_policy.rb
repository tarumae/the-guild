class MilestonePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      record.user == user
    end
  end
end
