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
    it "adds an isntance of Handle" do
      expect(Handle.all.count).to eq 0
      # binding.pry
      Handle.create_handle(twitter_user_instance)
      expect(Handle.all.count).to eq 1
    end
  end
end
