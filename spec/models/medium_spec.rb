require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe ".validates" do
    context "when created with good parameters" do
      it "will be valid" do
        expect(build(:medium)).to be_valid
      end
    end

    context "when created with any bad parameters" do
      it "will not be valid" do
        expect(build(:medium, uri: nil)).to be_invalid
        expect(build(:medium, posted_at: nil)).to be_invalid
      end
    end
  end

  describe ".create_medium" do
    context "when given an instance of Twitter::Tweet" do
      it "adds an instance of Medium" do
        expect(Medium.all.count).to eq 0
        create(:handle)
        Medium.create_tweet_medium($twitter.status(27558893223))
        expect(Medium.all.count).to eq 1
      end
    end
  end
end
