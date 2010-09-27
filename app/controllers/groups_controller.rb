class GroupsController < ApplicationController
  before_filter :authenticate
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    
    if @group.save
      redirect_to @group, :success => 'Group successfully added'
    else
      render 'new'
    end
  end
end
