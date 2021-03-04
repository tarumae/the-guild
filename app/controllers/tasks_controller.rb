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
    #As a user I can tick a task as done
    @milestone = Milestone.find(params[:milestone_id])
    @task = Task.find(params[:id])
    authorize @task
    @task.completed = params[:completed]
      if @task.completed
        if @task.save
          flash[:notice] = "#{@task.title} is now completed!"
          redirect_to guild_milestone_path(@milestone.guild, @milestone)
        else
          flash[:alert] =
            "Something went wrong. Please try again later. If this issue persists, please contact the support team."
        end
      elsif @task.completed == false
        if @task.save
          flash[:notice] = "#{@task.title} is still in progress!"
          redirect_to guild_milestone_path(@milestone.guild, @milestone)
        else
          flash[:alert] =
            "Something went wrong. Please try again later. If this issue persists, please contact the support team."
        end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :user_id)
  end
end
