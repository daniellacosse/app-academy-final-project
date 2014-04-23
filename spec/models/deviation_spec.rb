require 'spec_helper'

describe Deviation do

  describe "associations" do
    it { should belong_to(:user) }
  end

  context "validates presence" do
    let(:incomplete_deviation) { Deviation.new }

    it  "validates presence of :user_id" do
      expect(incomplete_deviation).to have(1).error_on(:user_id)
    end
    it "validates presence of :title" do
      expect(incomplete_deviation).to have(1).error_on(:title)
    end
    it "validates presence of :is_commentable" do
      expect(incomplete_deviation).to have(1).error_on(:is_commentable)
    end
    it "validates presence of :is_likeable" do
      expect(incomplete_deviation).to have(1).error_on(:is_likeable)
    end
    it "validates presence of :is_shareable" do
      expect(incomplete_deviation).to have(1).error_on(:is_shareable)
    end
    it "validates presence of :is_DRM" do
      expect(incomplete_deviation).to have(1).error_on(:is_DRM)
    end
    it "validates presence of :is_CC" do
      expect(incomplete_deviation).to have(1).error_on(:is_CC)
    end
    it "validates presence of :can_remix" do
      expect(incomplete_deviation).to have(1).error_on(:can_remix)
    end
    it  "validates presence of :is_mature" do
    expect(incomplete_deviation).to have(1).error_on(:is_mature)
    end
  end
end
