class Group < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy 
  
  validates :name,
    :presence => true
end
