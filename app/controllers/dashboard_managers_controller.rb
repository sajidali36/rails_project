# frozen_string_literal: true

class DashboardManagersController < ApplicationController
  before_action :set_project, only: %i[edit]
  def index
    @projects = Project.all
  end

  def show; end

  def edit; end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
