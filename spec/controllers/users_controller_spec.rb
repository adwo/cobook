require 'spec_helper'

describe UsersController do
  render_views
  
  describe 'GET new' do
    before do
      get :new
    end
    
    it 'should be successful' do
      response.should be_success
    end
    
    it 'should have registration form' do
      response.should have_selector('form#new_user')
    end
  end
  
  describe 'POST create' do
    describe 'failure' do
      before do
        @user = Factory.build(:user, :email => '')
        User.stub!(:new).and_return(@user)
        @user.should_receive(:save).and_return(false)
      end
      
      it 'should render the sign up page' do
        post :create, :user => @user
        response.should render_template('new')
      end
    end
    
    describe 'successful' do
      before do
        @user = Factory.build(:user)
        User.stub!(:new).and_return(@user)
        @user.should_receive(:save).and_return(true)
      end
      
      it 'should redirect to account page after login' do
        post :create, :user => @user
        response.should redirect_to(account_path)
      end
    end
  end
  
  describe 'GET show' do
    it 'should redirect unauthorized users to sign in page' do
      get :show
      response.should redirect_to(sign_in_path)
    end
    
    it 'should be successful for signed in user' do
      sign_in
      response.should be_success
    end
  end
end
