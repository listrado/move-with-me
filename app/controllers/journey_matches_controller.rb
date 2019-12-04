class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    @match = JourneyMatch.new(journey_params)
    @group = Group.where(start_hour: @match.start_hour)
    # end -> Location.near('16 Villa Gaudelet, Paris', 0.3)
    # start -> Location.near([45,45], 0.3)
    redirect_to user_path(current_user)
  end

  private

  def journey_params
    params.require(:journey_match).permit(:start_hour, :start_minute, :departure_address, :destination_address)
  end
end
