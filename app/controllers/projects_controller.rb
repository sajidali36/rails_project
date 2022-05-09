# frozen_string_literal: true

class ProjectsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_project, only: %i[show edit update destroy edit_users_list]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    # authorize! :read, @project
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  def edit_users_list
    @all_users = User.where.not(user_type: 0)
    @project_user = @project.projects_users.build
  end

  def create
    @project = Project.new(project_params)
    @project.user_ids = current_user.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if params[:project][:user_ids] != current_user.id
        params[:project][:user_ids].each do |id|
          @project.projects_users.create(user_id: id.to_i)
        end
        # @project.projects_users.create(user_id: params[:project][:user_ids][0].to_i)
        format.html { redirect_to project_url(@project), notice: 'Project was successfully updated1.' }
        format.json { render :show, status: :created, location: @project }
      elsif @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
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
