class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
     current_user.join group
   # @group_membership = GroupMembership.new(
    #  user_id: current_user.id,
    #
    #  group_id: params[:group_id]
   # )
   # @group_membership.save
   redirect_to :groups 
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.leave group

    redirect_to :groups
  end
end
