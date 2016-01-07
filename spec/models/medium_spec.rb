require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe ".validates" do
    context "when created with good parameters" do
      it "will be valid" do
        expect(Medium.new(type: "Tweet", handle_id: 1, uri: "website")).to be_valid
        expect(Medium.new(type: "Video", handle_id: 1, uri: "website")).to be_valid
      end
    end

    context "when created with any bad parameters" do
      it "will not be valid" do
        expect(Medium.new(type: nil, handle_id: 1, uri: "website")).to be_invalid
        expect(Medium.new(type: "Tweet", handle_id: nil, uri: "website")).to be_invalid
        expect(Medium.new(type: "Tweet", handle_id: 1, uri: nil)).to be_invalid
      end
      it "will not save to database" do
        Medium.create(type: nil, handle_id: 1, uri: "website")
        Medium.create(type: "Tweet", handle_id: nil, uri: "website")
        Medium.create(type: "Tweet", handle_id: 1, uri: nil)
        expect(Medium.all.count).to eq 0
      end
    end
  end

  describe ".create_medium" do
    context "when given an instance of Twitter::Tweet" do
      it "adds an instance of Medium" do
        expect(Medium.all.count).to eq 0
        Handle.create(name: "example", twitter_id: 7505382, uri: "link")
        Medium.create_medium($twitter.status(27558893223))
        expect(Medium.all.count).to eq 1
      end
    end
  end
end
