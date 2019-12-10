class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.group_id = params[:group_id]
    @message.user = current_user

    if @message.save
      redirect_to user_group_messages_path(current_user, current_user.journeys.last.group)
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject)
  end
end
