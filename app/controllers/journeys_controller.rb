class JourneysController < ApplicationController
  def new
    @journey = Journey.new
  end

  def create
  end

  def index
    @journeys = Journey.all
  end
end
