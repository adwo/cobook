require 'spec_helper'

describe ContactsController do
  render_views
  subject { controller }
  
  before do
    @group = Factory(:group)
  end
  
  def do_get(action)
    get action, :group_id => @group
  end
  
  it 'should redirect unsigned user to sign in page' do
    do_get(:index)
    response.should redirect_to(sign_in_path)
  end
    
  describe 'GET :index' do
    before do
      sign_in
      @group = Factory(:group)
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
end
