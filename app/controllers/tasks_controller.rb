class TasksController < ApplicationController
  before_action :set_project_and_task, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end
  
  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]

    if @task.save
      set_totals()

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @task, notice: "Task was successfully created." }
      end
    else
      @project = @task.project
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(helpers.dom_id(@task), partial: "tasks/task", locals: { task: @task }) }
        format.html { redirect_to @task, notice: "Task was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      set_totals()
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      end
    end
  end

  private
    def set_project_and_task
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:id])
    end

    def set_totals
      @total_tasks_outstanding = Task.where(project_id: params[:project_id], status: :to_do).size
      @total_tasks_completed = Task.where(project_id: params[:project_id], status: :complete).size
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :user_id)
    end
end
