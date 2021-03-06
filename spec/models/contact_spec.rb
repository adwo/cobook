require 'spec_helper'

describe Contact do
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(60) }
  
  it { should validate_presence_of(:gender) }
  it { should ensure_length_of(:gender).is_at_most(1) }
  it { should allow_value('m').for(:gender) }
  it { should_not allow_value('a').for(:gender) }
  
  it { should validate_format_of(:phone).with(Contact::PhoneRegexp) }
  
  it { should have_attached_file(:photo) }
  it { should validate_attachment_size(:photo).less_than(2.megabytes) }
  
  it 'should return display gender name' do
    @contact = Factory.build(:contact)
    @contact.gender_display.should == 'Male'
  end
end
