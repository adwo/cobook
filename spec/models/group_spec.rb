require 'spec_helper'

describe Group do
  it { should validate_presence_of(:name) }
end
