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
end
