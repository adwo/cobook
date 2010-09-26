require 'spec_helper'

describe PagesController do
  subject { controller }
  
  describe 'GET :index' do
    before do
      get :index
    end
    
    it { should respond_with(:success) }
  end
  
  describe 'GET :about' do
    before do
      get :about
    end
    
    it { should respond_with(:success) }
  end
end
