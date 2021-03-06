class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    is_owner?
  end

  def create?
    new?
  end

  def new?
    true
  end

  def edit?
    is_owner?
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
