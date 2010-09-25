require 'spec_helper'

describe ContactsController do
  describe 'GET :index' do
    before do
      get :index
    end
    
    it { should respond_with(:success) }
  end
end
