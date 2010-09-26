require 'spec_helper'

describe GroupsController do
  subject { controller }
  
  it 'should redirect not signed users to sign in page' do
    get :index
    response.should redirect_to(sign_in_path)
  end
end
