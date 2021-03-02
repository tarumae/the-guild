class MilestonesController < ApplicationController
before_action :set_milestone, only: :show
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
    @tasks = current_user.guild.milestone.tasks
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
