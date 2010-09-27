class Contact < ActiveRecord::Base
  PhoneRegexp   = /^((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$/
  CONTENT_TYPES = %w(image/png image/x-png image/jpeg image/pjpeg image/gif)
  
  belongs_to :group
  has_attached_file :photo, :styles => { :normal => '250x250>' },
    :path => ':rails_root/public/photos/:style_:id.:extension',
    :url => '/photos/:style_:id.:extension',
    :default_url => '/images/default_photo.jpg'
  
  # Name validations
  validates :name,
    :presence => true,
    :length => { :maximum => 60 }
  
  # Gender validations
  validates :gender,
    :presence => true,
    :inclusion => { :in => ['m', 'f'] },
    :length => { :maximum => 1 }
    
  # Phone validations
  validates :phone,
    :allow_blank => true,
    :format => { :with => PhoneRegexp }
  
  # Paperclip validations
  validates_attachment_content_type :photo, :content_type => CONTENT_TYPES,
    :unless =>  Proc.new { |model| model.photo_file_name.blank? }
  validates_attachment_size :photo, :less_than => 2.megabytes,
    :unless =>  Proc.new { |model| model.photo_file_name.blank? }
  
  # This method return display gender name: 'Male' for 'm' and 'Female' for 'f'.
  def gender_display
    case self.gender
    when 'm'
      I18n.t(:male, :default => 'Male')
    when 'f'
      I18n.t(:female, :default => 'Female')
    end
  end
end
