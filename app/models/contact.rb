class Contact < ActiveRecord::Base
  PhoneRegexp   = /^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$/
  CONTENT_TYPES = %w(image/png image/x-png image/jpeg image/pjpeg image/gif)
  
  has_attached_file :photo
  
  validates :name,
    :presence => true,
    :length => { :maximum => 60 }
    
  validates :gender,
    :inclusion => { :in => ['m', 'f'] },
    :length => { :maximum => 1 }
    
  validates :phone,
    :format => { :with => PhoneRegexp }
  
  validates_attachment_content_type :photo, :content_type => CONTENT_TYPES
end
