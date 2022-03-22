class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
  end

  def new
  end

  def create
  end
end
