class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    # params = journey_matches_params

    @journey_match = JourneyMatch.new(journey_matches_params)

    # location_params = {
    #   start_at:       @journey_match.start_at
    #   # start_location: Location.near([45, 45], 0.3),
    #   # end_location:   Location.near('16 Villa Gaudelet, Paris', 0.3)
    # }

    @groups = Group.where(start_at: @journey_match.start_at)
    @groups.each do |group|
      Location.near([20, 70], 10_444.0).each do |location|
        if location == group.start_location
      end
    end

    binding.pry
    redirect_to user_path(current_user)
  end

  private

  def journey_matches_params
    # params[:start_time] = "#{params['journey_match']['start_time(4i)']}:#{params['journey_match']['start_time(5i)']}"
    params.require(:journey_match).permit(:start_hour, :start_minute, :departure_address, :destination_address)
  end
end
