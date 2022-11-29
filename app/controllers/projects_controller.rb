class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = Project.active.order_by_latest
  end

  def show
    @users = User.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: "Project was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url
  end

  private
    def set_project
      @project = Project.includes(:tasks).find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :due_date, :status, :active)
    end
end
