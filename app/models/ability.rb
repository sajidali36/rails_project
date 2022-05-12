# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.manager?
      can :manage, :DashboardManagersController
      can :manage, Project
      can :read, Bug
    elsif user.developer?
      can :read, Project, projects_users: { user_id: user.id }
      can %i[read update], Bug
      can :manage, :DashboardDevelopersController
      cannot %i[update destroy], Project
      cannot %i[create destroy], Bug
    elsif user.qa?
      can :read, Project
      can %i[read create], Bug
      can :manage, :DashboardQasController
      cannot %i[create update destroy], Project
    end
  end
end
