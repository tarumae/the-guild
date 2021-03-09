class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :update, :destroy]

  def index
    @milestones = policy_scope(Milestone).where(guild: params[:guild_id])
    @guild = Guild.find(params[:guild_id])
  end

  def new
    @milestone = Milestone.new
    @guild = Guild.find(params[:guild_id])
    @milestone.guild = @guild
    authorize @milestone
  end

  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.guild = Guild.find(params[:guild_id])
    authorize @milestone
    if @milestone.save
      flash[:notice] = "Milestone successfully created!"
      redirect_to guild_milestone_path(@milestone.guild, @milestone)
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end

  def show
    @task = Task.new
    @milestone = Milestone.find(params[:id])
    @guild = Guild.find(params[:guild_id])
    @task.milestone = @milestone
    @tasks = @milestone.tasks
  end

  def update
    # As a guild admin I can reuse previous milestones
    @guild = Guild.find(params[:guild_id])
    @milestone.completed = params[:completed]
    if @milestone.completed
      if @milestone.save
        flash[:notice] = "#{@milestone.title} is now completed!"
        redirect_to guild_milestone_path(@guild, @milestone)
      else
        flash[:alert] =
          "Something went wrong. Please try again later. If this issue persists, please contact the support team."
      end
    elsif @milestone.completed == false
      if @milestone.save
        flash[:notice] = "#{@milestone.title} is activated!"
        redirect_to guild_milestone_path(@guild, @milestone)
      else
        flash[:alert] =
          "Something went wrong. Please try again later. If this issue persists, please contact the support team."
      end
    end
  end

  def destroy
    # As a guild admin I can archive or destroy a milestone
    @guild = @milestone.guild
    @milestone.destroy
    flash[:notice] = "Milestone successfully destroyed!"
    redirect_to guild_milestones_path(@milestone.guild)
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :description, :deadline, :reward)
  end

  def set_milestone
    @milestone = Milestone.find(params[:id])
    authorize @milestone
  end
end
