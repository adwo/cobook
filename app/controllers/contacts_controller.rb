class ContactsController < ApplicationController
  before_filter :authenticate
  
  def index
  end
  
  def new
    @group = Group.find(params[:group_id])
  end
end
