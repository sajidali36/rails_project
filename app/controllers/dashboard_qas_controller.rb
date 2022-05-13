# frozen_string_literal: true

class DashboardQasController < ApplicationController
  authorize_resource class: :DashboardQasController
  def index
    @projects = Project.all
  end
end
