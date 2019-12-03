class JourneysController < ApplicationController
  def index
    @journey = Journey.all
  end

  def new
    @journey = Journey.new
    @journey.build_group
  end

  def create
  end

  def index
    @journeys = Journey.all
  end
end
