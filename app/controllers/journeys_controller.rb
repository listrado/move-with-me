class JourneysController < ApplicationController
  def index
    @journey = Journey.all
  end

  def new
    @journey = Journey.new
    @journey.build_group
  end

  def create
    @user = current_user
    @journey = Journey.new(journey_params)
    @journey.user = @user
    @journey.save

    redirect_to user_path(current_user)
  end

  private

  def journey_params
    params.require(:journey).permit(:start_at, :start_location, :end_location)
  end
end
