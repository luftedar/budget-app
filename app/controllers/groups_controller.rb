class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Groups.find(params[:id])
  end

  def new
  end

  def create
  end
end
