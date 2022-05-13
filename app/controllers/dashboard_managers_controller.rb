# frozen_string_literal: true

class DashboardManagersController < ApplicationController
  authorize_resource class: :DashboardManagersController

  def index
    @projects = Project.all
  end
end
