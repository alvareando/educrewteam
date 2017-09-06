class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
   true  # Anyone can view a restaurant
  end

  def create?
    record.user = user  # Anyone can create a restaurant
  end

  def update?
    record.user == user  # Only restaurant creator can update it
  end

  end
end


