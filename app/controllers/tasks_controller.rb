class TasksController < ApplicationController
  def index
    @milestone = Milestone.find(params[:milestone_id])
    @tasks = @milestone.tasks
  end

  def create
    @milestone = Milestone.find(params[:milestone_id])
    @task = Task.new(task_params)
    @task.milestone = @milestone
    authorize @task
      if @task.save
        flash[:notice] = "Task successfully created!"
        redirect_to guild_milestone_path(@milestone)
      else
        flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end
