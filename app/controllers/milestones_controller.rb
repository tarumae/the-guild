class MilestonesController < ApplicationController
before_action :set_milestone, only: [:show, :update]
  def index
    @milestones = policy_scope(Milestone)
  end


  def new
    @milestone = Milestone.new
    @guild = Guild.find(params[:guild_id])
    authorize @milestone
  end

  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.guild = Guild.find(params[:guild_id])
    authorize @milestone
    if @milestone.save
      flash[:notice] = "Milestone successfully created!"
      redirect_to guild_milestones_path
    else
      flash[:alert] = "Something went wrong, please try again. If this issue persists, please contact us for help."
      render :new
    end
  end

  def show
    @tasks = @milestone.tasks
  end

  def update
    # As a guild admin I can reuse previous milestones
    @guild = Guild.find(params[:guild_id])
    @milestone.completed = params[:completed]
    if @milestone.completed
      if @milestone.save
        flash[:notice] = "#{@milestone.title} is now completed!"
        redirect_to guild_milestone_path(@milestone)
      else
        flash[:alert] =
          "Something went wrong. Please try again later. If this issue persists, please contact the support team."
      end
    elsif @milestone.completed == false
      if @milestone.save
        flash[:notice] = "#{@milestone.title} is activated!"
        redirect_to guild_milestone_path(@milestone)
      else
        flash[:alert] =
          "Something went wrong. Please try again later. If this issue persists, please contact the support team."
      end
    end
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :description, :deadline)
  end

  def set_milestone
    @milestone = Milestone.find(params[:id])
    authorize @milestone
  end
end
