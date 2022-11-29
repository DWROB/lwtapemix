class SongPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def new?
    false
  end

  def create?
    false
  end

  def edit?
    false
  end

  def update?
    #only the owner of playlist
    record.user == user
  end
end
