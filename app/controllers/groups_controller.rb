class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @message = Message.new
  end
end
