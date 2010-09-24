class UsersController < Clearance::UsersController
  def new
    @user = User.new
  end
end
