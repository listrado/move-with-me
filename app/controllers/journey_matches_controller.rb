class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    # params = journey_matches_params

    # binding.pry

    @journey_match = JourneyMatch.new(journey_matches_params)

    # location_params = {
    #   start_at:       @journey_match.start_at
    #   # start_location: Location.near([45, 45], 0.3),
    #   # end_location:   Location.near('16 Villa Gaudelet, Paris', 0.3)
    # }

    groups = Group.where(start_at: @journey_match.start_at)
    location_start = Location.find_or_create_by(address: @journey_match.departure_address)
    location_end = Location.find_or_create_by(address: @journey_match.destination_address)
    groups.each do |group|
      Location.near([location_start.latitude, location_start.longitude], 0.3).each do |location|
        next unless location == group.start_location
        @group = group
        journey = Journey.new(group: @group, user: current_user)
        journey.save
        break
      end
      break if @group
    end
    unless @group
      @group = Group.new(
        start_at: @journey_match.start_at,
        start_location: location_start,
        end_location: location_end
      )
      @group.save
      journey = Journey.new(group: @group, user: current_user)
      journey.save
    end
    redirect_to user_path(current_user)
  end

  private

  def journey_matches_params
    # params[:start_time] = "#{params['journey_match']['start_time(4i)']}:#{params['journey_match']['start_time(5i)']}"
    params.require(:journey_match).permit(:start_hour, :start_minute, :departure_address, :destination_address)
  end
end
