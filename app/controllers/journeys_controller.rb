class JourneysController < ApplicationController
  def destroy
    @journey = Journey.find(params[:id])
    @journey.destroy

    redirect_to current_user
  end

  def create
    @group = Group.find(params[:group_id])
    @journey = Journey.new(group: @group, user: current_user)
    @journey.save
    flash[:notice] = "You joined a group."

    redirect_to user_group_path(current_user, @group)
  end
end
