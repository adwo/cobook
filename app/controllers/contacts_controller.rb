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
  
  def create
    @group = Group.find(params[:group_id])
    @contact = @group.contacts.new(params[:contact])
    
    if @contact.save
      redirect_to group_contact_path(@group, @contact),
        :notice => 'Contact successfully created.'
    else
      render 'new'
    end
  end
  
  def show
    @group = Group.find(params[:group_id])
    @contact = Contact.find(params[:id])
  end
end
