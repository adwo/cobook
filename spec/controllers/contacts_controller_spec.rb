require 'spec_helper'

describe ContactsController do
  subject { controller }
  
  describe 'GET :index' do
    describe 'unsigned' do
      before do
        get :index
      end
    
      it { should respond_with(:redirect) }
      it { should redirect_to(sign_in_path) }
    end
    
    describe 'signed in' do
      before do
        sign_in
        get :index
      end
      
      it { should respond_with(:success) }
    end
  end
end
