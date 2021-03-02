class MilestonesController < ApplicationController
before_action :set_allotment, only: :show
  def show
    @tasks = current_user.guilds.milestones.tasks
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
    authorize @milestone
  end
end
