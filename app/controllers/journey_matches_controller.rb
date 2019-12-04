class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    # params = journey_params

    @match = JourneyMatch.new(journey_params)
    @group = Group.where(start_at: @match.start_at)
    # start -> Location.near([45,45], 0.3)
    # end -> Location.near('16 Villa Gaudelet, Paris', 0.3)
    raise
    redirect_to user_path(current_user)
  end

  private

  def journey_params
    binding.pry

    # params[:start_time] = "#{params['journey_match']['start_time(4i)']}:#{params['journey_match']['start_time(5i)']}"
    params.require(:journey_match).permit(:start_hour, :start_minute, :departure_address, :destination_address)
  end
end
