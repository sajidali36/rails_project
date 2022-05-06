# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.user_type.zeros?
      can :manage, :all
    elsif user.user_type == 1
      can :manage, Project, user_ids: user.id
      can :read, :all
    end
  end
end
