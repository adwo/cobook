class GroupsController < ApplicationController
  before_filter :authenticate
  
  def index
    @groups = Group.where(:user_id => current_user)
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    @group.user_id = current_user
    
    if @group.save
      redirect_to group_contacts_path(@group),
        :notice => 'Group successfully created.'
    else
      render 'new'
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    
    if @group.update_attributes(params[:group])
      redirect_to group_contacts_path(@group),
        :notice => 'Group successfully updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    Group.find(params[:id]).destroy
    
    redirect_to groups_path
  end
end
