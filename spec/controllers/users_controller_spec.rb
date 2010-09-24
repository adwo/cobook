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
end
