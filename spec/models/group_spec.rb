require 'spec_helper'

describe Group do
  it { should belong_to(:user) }
  it { should have_many(:contacts).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
