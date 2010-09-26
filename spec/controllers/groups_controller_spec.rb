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
    it { should have_selector('ul.groups') }
  end
end
