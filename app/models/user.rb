class User < ActiveRecord::Base
  include Clearance::User
  after_create :confirm_user
  has_attached_file :photo
  
  def deliver_confirmation_email
    # Do Nothing
  end
  
  private
    def confirm_user
      self.update_attribute(:email_confirmed, true)
    end
end
