class JourneyMatch
  include ActiveModel::Model

  attr_accessor :start_hour, :start_minute, :departure_address, :destination_address, :diference_in_minutes

  def start_at
    # DateTime.parse(Date.today.to_s + " #{start_hour}:#{start_minute}")
    Time.new(Time.current.year, Time.current.month, Time.current.day, start_hour.to_i, start_minute)
  end

  def time_zone
    diference_in_minutes.to_i / 60
  end
end
