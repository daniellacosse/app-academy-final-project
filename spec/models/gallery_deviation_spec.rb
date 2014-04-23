require 'spec_helper'

describe GalleryDeviation do
  describe "associations" do
    it { should belong_to(:deviation) }
    it { should belong_to(:gallery) }
  end

  context "validates presence" do
    let(:incomplete_gallery_deviation) { GalleryDeviation.new }

    it "validates presence of :gallery" do
      expect(incomplete_gallery_deviation).to have(1).error_on(:gallery)
    end

    it "validates presence of :deviation_id" do
      expect(incomplete_gallery_deviation).to have(1).error_on(:deviation_id)
    end
  end
end
