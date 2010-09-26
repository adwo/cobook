class SessionsController < Clearance::SessionsController
  private
    def url_after_create
      groups_path
    end
end
