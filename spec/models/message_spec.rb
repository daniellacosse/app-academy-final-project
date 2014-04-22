require 'spec_helper'

describe Message do
  describe "associations" do
    it { should belong_to(:user) }
  end

  context "validates presence" do
    let(:incomplete_message) { Message.new }

    it "validates presence of :title" do
      expect(incomplete_message).to have(1).error_on(:title)
    end

    it "validates presence of :body" do
      expect(incomplete_message).to have(1).error_on(:body)
    end

    it "validates presence of :user_id" do
      expect(incomplete_message).to have(1).error_on(:user_id)
    end

    it "validates presence of :author_id" do
      expect(incomplete_message).to have(1).error_on(:author_id)
    end
  end
end
