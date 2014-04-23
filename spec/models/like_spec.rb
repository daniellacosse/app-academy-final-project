require 'spec_helper'

describe Like do
  context "associations" do
    it { should belong_to(:liker) }
    it { should belong_to(:likeable) }
  end
end
