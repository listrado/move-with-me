class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.group_id = params[:group_id]
    @message.user = current_user

    if @message.save
      redirect_to user_group_path(current_user, @message.group)
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject)
  end
end
