# frozen_string_literal: true

class DashboardDevelopersController < ApplicationController
  authorize_resource class: :DashboardDevelopersController

  def index
    @projects = current_user.projects
  end
end
