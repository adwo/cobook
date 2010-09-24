class User < ActiveRecord::Base
  include Clearance::User
  has_attached_file :photo
end
