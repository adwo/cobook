class UsersController < Clearance::UsersController
  private
    def url_after_create
      groups_path
    end
end
