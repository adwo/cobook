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
     
    it 'should have link for creatng new group' do
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
end
