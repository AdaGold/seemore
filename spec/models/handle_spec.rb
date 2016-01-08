require 'rails_helper'

RSpec.describe Handle, type: :model do
  let(:twitter_user_instance) do
    $twitter.user("houglande")
  end

  describe ".validates" do
    context "when created with good parameters" do
      it "will be valid" do
        expect(Handle.new(name: "example", twitter_id: 1, uri: "link")).to be_valid
      end
    end

    context "when created with any bad parameters" do
      it "will not be valid" do
        expect(Handle.new(name: nil, twitter_id: 1, uri: "link")).to be_invalid
        expect(Handle.new(name: "example", twitter_id: nil, uri: "link")).to be_invalid
        expect(Handle.new(name: "example", twitter_id: 1, uri: nil)).to be_invalid
      end
      it "will not save to database" do
        Handle.create(name: nil, twitter_id: 1, uri: "link")
        Handle.create(name: "example", twitter_id: nil, uri: "link")
        Handle.create(name: "example", twitter_id: 1, uri: nil)
        expect(Handle.all.count).to eq 0
      end
    end
  end

  describe ".create_handle" do
    context "when given an instance of Twitter::User" do
      it "adds an instance of Handle" do
        expect(Handle.all.count).to eq 0
        Handle.create_handle(twitter_user_instance)
        expect(Handle.all.count).to eq 1
      end
    end
  end

  describe ".search" do
    before(:each) do
      Handle.create(name: "houglande", twitter_id: 1, uri: "link")
    end
    it "returns array" do
      expect(Handle.search("houglande")).to be_kind_of(Array)
    end
    it "returns array of Twitter::User instances" do
      expect(Handle.search("houglande")[0]).to be_an_instance_of(Twitter::User)
    end
    it "returns correct instance of Twitter::User" do
      search_results = Handle.search("houglande")
      expect(search_results[0].id).to eq 18424269
    end
  end
end
