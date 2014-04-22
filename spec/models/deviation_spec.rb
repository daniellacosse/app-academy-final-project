require 'spec_helper'

describe Deviation do
  context "validates presence" do
    let(:incomplete_deviation) { Deviation.new }

    it  "validates presence of :user_id" do
      exepct(inomplete_deviation).to have(1).error_on(:user_id)
    end
    it "validates presence of :title" do
      exepct(inomplete_deviation).to have(1).error_on(:title)
    end
    it "validates presence of :is_commentable" do
      exepct(inomplete_deviation).to have(1).error_on(:is_commentable)
    end
    it "validates presence of :is_likeable" do
      exepct(inomplete_deviation).to have(1).error_on(:is_likeable)
    end
    it "validates presence of :is_shareable" do
      exepct(inomplete_deviation).to have(1).error_on(:is_shareable)
    end
    it "validates presence of :is_DRM" do
      exepct(inomplete_deviation).to have(1).error_on(:is_DRM)
    end
    it "validates presence of :is_CC" do
      exepct(inomplete_deviation).to have(1).error_on(:is_CC)
    end
    it "validates presence of :can_remix" do
      exepct(inomplete_deviation).to have(1).error_on(:can_remix)
    end
    it  "validates presence of :is_mature" do
    exepct(inomplete_deviation).to have(1).error_on(:is_mature)
    end
  end
end
