class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @journey = Journey.find_by(user_id: current_user, group_id: params[:id])
  end
end
