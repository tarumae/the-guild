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
      redirect_to guild_milestone_path(@milestone.guild, @milestone)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
    end
  end

  def update
    # As a user I can tick a task as done
    @milestone = Milestone.find(params[:milestone_id])
    @task = Task.find(params[:id])
    authorize @task
    if @task.update(task_params)
      flash[:notice] = "#{@task.title} is now #{@task.completed ? 'completed' : 'in progress'}!"
      redirect_to guild_milestone_path(@milestone.guild, @milestone)
    else
      flash[:alert] =
        "Something went wrong. Please try again later. If this issue persists, please contact the support team."
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :user_id, :completed)
  end
end
