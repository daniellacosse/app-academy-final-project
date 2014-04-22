require 'spec_helper'

describe Journal do
  describe "associations" do
    it { should belong_to(:user) }
  end

  context "validates presence" do
    let(:incomplete_journal) { Journal.new }

    it "validates presence of " do
      expect(incomplete_journal).to have(1).error_on(:title)
    end

    it "validates presence of :user_id" do
      expect(incomplete_journal).to have(1).error_on(:user_id)
    end
  end
end