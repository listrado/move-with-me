class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.create(group_params)
    @journey = Journey.new
    @journey.user = @user
    @journey.group = @group
    @journey.save

    redirect_to user_path(current_user)
  end

  private

  def group_params
    params.require(:group).permit(:start_at, :start_location, :end_location)
  end
end
