class JourneyMatchesController < ApplicationController
  def new
    @journey_match = JourneyMatch.new
  end

  def create
    @journey_match = JourneyMatch.new(journey_matches_params)

    # location_params = {
    #   start_at:       @journey_match.start_at
    #   # start_location: Location.near([45, 45], 0.3),
    #   # end_location:   Location.near('16 Villa Gaudelet, Paris', 0.3)
    # }
    groups = Group.where(start_at: (@journey_match.start_at_date - 15.minutes)..(@journey_match.start_at_date + 15.minutes))
    location_start = Location.find_or_create_by(address: @journey_match.departure_address)
    location_end = Location.find_or_create_by(address: @journey_match.destination_address)

    group_find(groups, location_start, location_end)

    create_group!(location_start, location_end) unless @group

    journey = Journey.new(group: @group, user: current_user, diference_in_minutes: @journey_match.diference_in_minutes)
    journey.save
    redirect_to user_group_path(current_user, @group)
  end

  def find
    @journey_match = JourneyMatch.new(journey_matches_params)

    groups = Group.where(start_at: (@journey_match.start_at_date - 15.minutes)..(@journey_match.start_at_date + 15.minutes))
    location_start = Location.find_or_create_by(address: @journey_match.departure_address)
    location_end = Location.find_or_create_by(address: @journey_match.destination_address)

    @group = group_find(groups, location_start, location_end)

    respond_to { |format| format.js }
  end

  private

  def create_group!(location_start, location_end)
    @group = Group.new(
      start_at: @journey_match.start_at_date,
      start_location: location_start,
      end_location: location_end
    )
    @group.save
  end

  def group_find(groups, location_start, location_end)
    groups.each do |group|
      Location.near([location_start.latitude, location_start.longitude], 0.3).each do |start_location|
        next unless start_location == group.start_location
        Location.near([location_end.latitude, location_end.longitude], 0.3).each do |end_location|
          next unless end_location == group.end_location
          @group = group
          break
        end
        break
      end
      break if @group
    end
    @group
  end

  def journey_matches_params
    # params[:start_time] = "#{params['journey_match']['start_time(4i)']}:#{params['journey_match']['start_time(5i)']}"
    params.require(:journey_match).permit(:start_at, :departure_address, :destination_address, :diference_in_minutes)
  end
end
