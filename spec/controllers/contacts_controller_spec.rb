require 'spec_helper'

describe ContactsController do
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
      do_get(:index)
    end
    
    it { should respond_with(:success) }
  end
  
  describe 'GET :new' do
    before do
      sign_in
      do_get(:new)
    end
    
    it { should respond_with(:success) }
  end
end
