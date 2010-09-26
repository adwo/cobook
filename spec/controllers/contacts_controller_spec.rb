require 'spec_helper'

describe ContactsController do
  subject { controller }
  
  before do
    @group = Factory.create(:group)
  end
  
  def do_get
    get :index, :group_id => @group
  end
  
  it 'should redirect unsigned user to sign in page' do
    do_get
    response.should redirect_to(sign_in_path)
  end
    
  describe 'signed in' do
    before do
      sign_in
      do_get
    end
    
    it { should respond_with(:success) }
  end
end
