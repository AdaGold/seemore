require 'rails_helper'

RSpec.describe Medium, type: :model do
  let(:twitter_user_instance) do
    $twitter.user("houglande")
  end

  describe ".validates" do
    context "when created with good parameters" do
      it "will be valid" do
        expect(Medium.new(type: "Tweet", handle_id: 1, uri: "website")).to be_valid
      end
    end

    # context "when created with any bad parameters" do
    #   it "will not be valid" do
    #     expect(Medium.new(name: nil, twitter_id: 1, uri: "link")).to be_invalid
    #     expect(Medium.new(name: "example", twitter_id: nil, uri: "link")).to be_invalid
    #     expect(Medium.new(name: "example", twitter_id: 1, uri: nil)).to be_invalid
    #   end
    #   it "will not save to database" do
    #     Medium.create(name: nil, twitter_id: 1, uri: "link")
    #     Medium.create(name: "example", twitter_id: nil, uri: "link")
    #     Medium.create(name: "example", twitter_id: 1, uri: nil)
    #     expect(Medium.all.count).to eq 0
    #   end
    # end
  end

  # describe ".create_Medium" do
  #   context "when given an instance of Twitter::User" do
  #     it "adds an instance of Medium" do
  #       expect(Medium.all.count).to eq 0
  #       Medium.create_Medium(twitter_user_instance)
  #       expect(Medium.all.count).to eq 1
  #     end
  #   end
  # end
end
