require 'spec_helper'

describe Group do
  it { should have_many(:contacts).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
