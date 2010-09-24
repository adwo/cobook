class UsersController < Clearance::UsersController
  private
    def url_after_create
      contacts_path
    end
end
