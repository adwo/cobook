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
        :success => 'Group successfully added'
    else
      render 'new'
    end
  end
end
