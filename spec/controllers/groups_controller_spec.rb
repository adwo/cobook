require 'spec_helper'

describe GroupsController do
  render_views
  subject { controller }
  
  it 'should redirect not signed users to sign in page' do
    get :index
    response.should redirect_to(sign_in_path)
  end
  
  describe 'GET :index' do
    before do
      sign_in
      get :index
    end
    
    it { should respond_with(:success) }
    
    it 'should have groups list' do
      response.should have_selector('ul.groups')
    end
     
    it 'should have a link for creatng new group' do
      response.should have_selector('a', :href => new_group_path)
    end
  end
  
  describe 'GET :new' do
    before do
      sign_in
      get :new
    end
    
    it { should respond_with(:success) }
    
    it 'should have form for creating new group' do
      response.should have_selector('form#new_group')
    end
  end
  
  describe 'POST :create' do
    before do
      sign_in
    end
    
    describe 'failure' do
      before do
        @group = Factory.build(:group, :name => '')
        Group.stub!(:new).and_return(@group)
        @group.should_receive(:save).and_return(false)
        post :create, :group => @group
      end
      
      it { should render_template(:new) }
    end
    
    describe 'successful' do
      before do
        @group = Factory(:group)
        Group.stub!(:new).and_return(@group)
        @group.should_receive(:save).and_return(true)
        post :create, :group => @group
      end
      
      it { should redirect_to(group_contacts_path(@group)) }
    end
  end
  
  describe 'GET :edit' do
    before do
      sign_in
      @group = Factory(:group)
      get :edit, :id => @group
    end
    
    it { should respond_with(:success) }
    
    it 'should have a form for editing group' do
      response.should have_selector('form#edit_group')
    end
  end
end
