class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Groups.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      flash[:notice] = 'Group Created Successfully'
      redirect_to @group
    else
      flash[:notice] = 'Failed to Create Group'
      render 'new'
    end
  end
end
