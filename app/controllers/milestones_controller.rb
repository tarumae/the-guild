class MilestonesController < ApplicationController
before_action :set_milestone, only: :show
  def index
    @milestones = policy_scope(Milestone)
  end

  def show
    @tasks = current_user.guild.milestone.tasks
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
    authorize @milestone
  end
end
