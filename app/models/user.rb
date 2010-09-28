class User < ActiveRecord::Base
  include Clearance::User
  after_create :confirm_user
  
  # Override Clearance method for disable email confirmation
  def send_confirmation_email
    # Do Nothing
  end
  
  private
    def confirm_user
      self.update_attribute(:email_confirmed, true)
    end
end
