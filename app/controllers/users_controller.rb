class UsersController < Clearance::UsersController
  private
    def url_after_create
      account_path
    end
end
