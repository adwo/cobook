class SessionsController < Clearance::SessionsController
  private
    def url_after_create
      contacts_path
    end
end
