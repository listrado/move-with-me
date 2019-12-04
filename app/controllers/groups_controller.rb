class GroupsController < ApplicationController
  def index
    @groups = Groups.all
  end
end
