class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.tutor
  end

  def live?
    user.paid_for? record
    user == record.tutor
  end
end
