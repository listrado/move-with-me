class JourneyMatch
  include ActiveModel::Model

  attr_accessor :start_hour, :start_minute, :departure_address, :destination_address

  def start_at
    # DateTime.parse(Date.today.to_s + " #{start_hour}:#{start_minute}")
    Time.new(Time.current.year, Time.current.month, Time.current.day, start_hour - 3, start_minute)
  end
end
