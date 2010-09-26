require 'spec_helper'

describe UsersController do
  render_views
  subject { controller }
  
  describe 'GET :new' do
    before do
      get :new
    end
    
    it { should respond_with(:success) }
    
    it 'should have registration form' do
      response.should have_selector('form#new_user')
    end
  end
  
  describe 'POST :create' do
    describe 'failure' do
      before do
        @user = Factory.build(:user, :email => '')
        User.stub!(:new).and_return(@user)
        @user.should_receive(:save).and_return(false)
        post :create, :user => @user
      end
      
      it { should render_template(:new) }
    end
    
    describe 'successful' do
      before do
        @user = Factory.build(:user)
        User.stub!(:new).and_return(@user)
        @user.should_receive(:save).and_return(true)
        post :create
      end
      
      it { should redirect_to(groups_path) }
    end
  end
end
