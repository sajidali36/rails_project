# frozen_string_literal: true

class DashboardQasController < ApplicationController
  def index
    @projects = Project.all
  end
end
