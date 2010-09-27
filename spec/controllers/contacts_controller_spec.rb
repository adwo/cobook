require 'spec_helper'

describe ContactsController do
  render_views
  subject { controller }
  
  before do
    @group = Factory(:group)
  end
  
  def do_get(action, id=nil)
    if id.nil?
      get action, :group_id => @group
    else
      get action, :id => id, :group_id => @group
    end
  end
  
  it 'should redirect unsigned user to sign in page' do
    do_get(:index)
    response.should redirect_to(sign_in_path)
  end
    
  describe 'GET :index' do
    before do
      sign_in
      do_get(:index)
    end
    
    it { should respond_with(:success) }
    
    it 'should have a link for creating new contact' do
      response.should have_selector('a',
        :href => new_group_contact_path(@group))
    end
  end
  
  describe 'GET :new' do
    before do
      sign_in
      do_get(:new)
    end
    
    it { should respond_with(:success) }
    
    it 'should have a new contact form' do
      response.should have_selector('form#new_contact')
    end
  end
  
  describe 'POST :create' do
    before do
      sign_in
    end
    
    describe 'failure' do
      before do
        @contact = Factory.build(:contact, :name => '')
        Contact.stub!(:new).and_return(@contact)
        @contact.should_receive(:save).and_return(false)
        post :create, :contact => @contact, :group_id => @group
      end
      
      it { should render_template(:new) }
    end
    
    describe 'successful' do
      before do
        @contact = Factory(:contact)
        Contact.stub!(:new).and_return(@contact)
        @contact.should_receive(:save).and_return(true)
        post :create, :contact => @contact, :group_id => @group
      end
      
      it { should redirect_to(group_contact_path(@group, @contact)) }
    end
  end
  
  describe 'GET :show' do
    before do
      sign_in
      @contact = Factory(:contact)
      do_get(:show, @contact)
    end
    
    it { should respond_with(:success) }
  end
end
