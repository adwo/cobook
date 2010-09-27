class ContactsController < ApplicationController
  before_filter :authenticate
  
  def index
    @group = Group.find(params[:group_id])
    @contacts = @group.contacts
  end
  
  def new
    @group = Group.find(params[:group_id])
    @contact = @group.contacts.new
  end
end
