# frozen_string_literal: true

class DashboardDevelopersController < ApplicationController
  def index
    @projects = current_user.projects
  end
end
