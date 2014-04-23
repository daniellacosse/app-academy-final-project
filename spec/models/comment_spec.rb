require 'spec_helper'

describe Comment do
  context "associations" do
    it { should belong_to(:commenter) }
    it { should belong_to(:commentable) }

    it { should have_many(:comments) }
  end
end
