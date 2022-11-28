class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

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
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def mark_as_complete
    @task = Task.find_by(id: params[:task_id], project_id: params[:project_id])

    if @task&.update(status: :complete)
      set_totals()

      respond_to do |format|
        format.turbo_stream
      end
    else
      # task not found with params passed, or unable to update
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_totals
      @project ||= Project.find(params[:project_id])
      @total_tasks_outstanding = @project.tasks.to_do.size
      @total_tasks_completed = @project.tasks.complete.size
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :user_id)
    end
end
