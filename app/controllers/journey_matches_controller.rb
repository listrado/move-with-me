class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    # params = journey_matches_params

    @journey_match = JourneyMatch.new(journey_matches_params)
    @group = Group.where(start_at: @journey_match.start_at)
    # start -> Location.near([45,45], 0.3)
    # end -> Location.near('16 Villa Gaudelet, Paris', 0.3)
    redirect_to user_path(current_user)
  end

  private

  def journey_matches_params
    # params[:start_time] = "#{params['journey_match']['start_time(4i)']}:#{params['journey_match']['start_time(5i)']}"
    params.require(:journey_match).permit(:start_hour, :start_minute, :departure_address, :destination_address)
  end
end
