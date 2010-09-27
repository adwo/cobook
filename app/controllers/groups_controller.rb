class GroupsController < ApplicationController
  before_filter :authenticate
  
  def index
    @groups = Group.all
  end
  
  def new
  end
end
