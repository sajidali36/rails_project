# frozen_string_literal: true

class BugsController < ApplicationController
  before_action :fetch_project
  before_action :set_bug, only: %i[show edit update destroy]

  def index
    @bugs = @project.bugs
  end

  def show; end

  def new
    @bug = @project.bugs.build
  end

  def edit; end

  def assign_bugs_to_user
    @bugs = @project.bugs
  end

  def add_bugs_to_user
    if params[:bug_ids]
      @user = current_user
      @user.bug_ids = params[:bug_ids].map(&:to_i)
      redirect_to project_path(@project), notice: 'Bug was successfully updated.'
    else
      redirect_to dashboard_developers_path, notice: 'Bug was not successfully updated.'
    end
  end

  def create
    @bug = @project.bugs.build(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to project_bugs_path(@project), notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to project_bug_path(@project), notice: 'Bug was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to project_bugs_path(@project), notice: 'Bug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bug
    @bug = @project.bugs.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :screenshot, :deadline, :project_id, :bug_type, :status)
  end

  def fetch_project
    @project = Project.find(params[:project_id])
  end
end
