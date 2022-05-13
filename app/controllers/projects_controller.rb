# frozen_string_literal: true

class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: %i[show edit update destroy edit_users_list]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show; end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  def edit_users_list; end

  def create
    @project = Project.new(project_params)
    @project.user_ids = current_user.id

    if @project.save
      redirect_to project_url(@project), notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if params[:project][:user_ids] && params[:project][:user_ids] != current_user.id
      @project.user_ids = params[:project][:user_ids].map(&:to_i)
      redirect_to project_url(@project), notice: 'Project was successfully updated1.'
    elsif @project.update(project_params)
      redirect_to project_url(@project), notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to dashboard_managers_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_user_params
    params.require(:project).permit(:user_ids)
  end

  def project_params
    params.require(:project).permit(:title, :description, user_ids: [])
  end
end
