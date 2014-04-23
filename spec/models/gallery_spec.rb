require 'spec_helper'

describe Gallery do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:deviations) }
  end

  context "validates presence" do
    let(:incomplete_gallery) { Gallery.new }

    it "validates presence of :title" do
      expect(incomplete_gallery).to have(1).error_on(:title)
    end

    it "validates presence of :user_id" do
      expect(incomplete_gallery).to have(1).error_on(:user_id)
    end
  end
end
