require 'spec_helper'

describe View do
  context "associations" do
    it { should belong_to(:viewer) }
    it { should belong_to(:viewable) }
  end
end
