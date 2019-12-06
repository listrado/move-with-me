class UsersController < ApplicationController
  def show
    @journeys = current_user.journeys.all
  end
end
