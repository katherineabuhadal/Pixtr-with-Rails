class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @groups = Group.all 

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params) 

    if @group.save
      GroupMembership.create(
        user_id: current_user.id,
        group_id: @group.id
      )
      redirect_to :groups
    else
      render :new
    end
  end

  def index
    @groups = Group.all
    @my_groups = current_user.groups
    @group_membership = GroupMembership.new
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to :groups
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
