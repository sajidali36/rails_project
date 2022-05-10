# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.manager?
      can :manage, :all
    elsif user.developer?
      can :read, Project
      can %i[read update], Bug
      can :manage, :DashboardDevelopersController
    elsif user.qa?
      can :read, Project
      can :manage, Bug
    end
  end
end
