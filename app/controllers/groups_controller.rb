class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @journey = Journey.find_by(user_id: current_user, group_id: params[:id])

    @markers = [
      {
        lat: @group.start_location.latitude,
        lng: @group.start_location.longitude
      },
      {
        lat: @group.end_location.latitude,
        lng: @group.end_location.longitude,
        image_url: helpers.asset_url('flag.svg')
      }
    ]
  end
end
