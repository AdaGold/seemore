require 'rails_helper'

RSpec.describe Handle, type: :model do
  let(:twitter_user_instance) do
    $twitter.user("houglande")
  end

  describe ".validates" do
    context "when created with good parameters" do
      it "will be valid" do
        expect(build(:handle)).to be_valid
      end
    end

    context "when created with any bad parameters" do
      it "will not be valid" do
        expect(build(:handle, name: nil)).to be_invalid
        expect(build(:handle, uri: nil)).to be_invalid
        expect(build(:handle, provider: nil)).to be_invalid
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
      create(:handle)
    end
    it "returns array" do
      expect(Handle.search("houglande")).to be_kind_of(Array)
    end
    it "returns array of Twitter::User instances" do
      expect(Handle.search("houglande")[0]).to be_an_instance_of(Twitter::User)
    end
    it "returns correct instance of Twitter::User" do
      search_results = Handle.search("houglande")
      expect(search_results).to include(twitter_user_instance)
    end
  end

  describe ".create_vimeo_handle" do
    it "increases num of Handles by 1" do
      expect(Handle.all.count).to eq 0
      Handle.create_vimeo_handle("/users/657778")
      # https://vimeo.com/user657778
      expect(Handle.all.count).to eq 1
    end
  end
end
