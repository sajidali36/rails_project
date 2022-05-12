# frozen_string_literal: true

class DashboardManagersController < ApplicationController
  authorize_resource class: :DashboardManagersController
  before_action :set_project, only: %i[edit]
  def index
    @projects = Project.all
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
