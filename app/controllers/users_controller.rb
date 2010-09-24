class UsersController < Clearance::UsersController
  before_filter :authenticate, :only => :show
  
  def show
  end
  
  private
    def url_after_create
      account_path
    end
end
