class JourneyController < ApplicationController
  def destroy
    redirect_to current_user
    @journey = Journey.find(params[:id])
    @journey.destroy
  end
end
