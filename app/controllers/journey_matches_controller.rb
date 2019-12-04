class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    # params = journey_matches_params

    @journey_match = JourneyMatch.new(journey_matches_params)
    @group = Group.find_by(
      start_at: @journey_match.start_at,
      # start_location: Location.near('Address ???????', 0.3),
      # end_location: Location.near('?????, Paris', 0.3)
    )

    # IF there`s a group matching
    # add the user to the group
    # ELSE
    # create the group and add the user there

    redirect_to user_path(current_user)
  end

  private

  def journey_matches_params
    # params[:start_time] = "#{params['journey_match']['start_time(4i)']}:#{params['journey_match']['start_time(5i)']}"
    params.require(:journey_match).permit(:start_hour, :start_minute, :departure_address, :destination_address)
  end
end
