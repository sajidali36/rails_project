# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # case user
    # when 'manager'
    #   can :manage, :all
    # when 'developer'
    #   can :manage, :Project
    # when 'qa'
    #   can :create, Bug
    # end

    if user.manager?
      can :manage, :all
    elsif user.developer?
      # can :manage, Project, user_ids: user.id
      can :read, Project
    elsif user.qa?
      # can :manage, Project, user_ids: user.id
      can :read, Project
      can :manage, Bug
    end
  end
end
