class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    is_owner?
  end

  def show?
    true
  end

  def create?
    new?
  end

  def new?
    true
  end

  def update?
    edit?
  end

  def delete?
    is_owner?
  end

  private

  def is_owner?
    record.user == user
  end

end
