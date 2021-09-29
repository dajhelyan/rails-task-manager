class TasksController < ApplicationController
  # return all taks from db Task
  def index
    @tasks = Task.all
  end
  # return a task for id
  def show
    @tasks = Task.find(params[:id])
  end
  # create a task instance
  def new
    # create
    @task = Task.new
    
  end

  def create
    @task = Task.new(task_params)
    # save the task instance
    if @task.save
      # redirect to the tasks views
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
