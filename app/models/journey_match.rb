class JourneyMatch
  include ActiveModel::Model

  attr_accessor :start_hour, :start_minute, :departure_address, :destination_address

  def start_at
    DateTime.parse(Date.today.to_s + " #{start_hour}:#{start_minute}")
  end
end
