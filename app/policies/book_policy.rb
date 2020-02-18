class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    is_owner?
  end

  def delete?
    is_owner?
  end

  private

  def is_owner?
    record.user = user
  end

end
