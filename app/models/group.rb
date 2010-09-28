class Group < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, :dependent => :destroy
  
  validates :name,
    :presence => true
end
