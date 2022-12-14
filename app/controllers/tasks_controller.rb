class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ edit update destroy ]
  before_action :set_project, only: %i[ new edit update create destroy ]

  def new
    @task = Task.new
  end
  
  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]
    
    if @task.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :user_id)
    end
end
