require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:twitter_identity) {
    Identity.new(
    uid: "1234",
    provider: "twitter",
    user_id: "1"
    )
  }

  # let(:vimeo_identity) {
  #   Identity.new(
  #   uid: "1234",
  #   provider: "vimeo",
  #   user_id: "1"
  #   )
  # }

  describe "validations" do
    it "is valid" do
      expect(twitter_identity).to be_valid
      # expect(vimeo_identity).to be_valid
    end

    it "requires a uid" do
      twitter_identity.uid = nil
      expect(twitter_identity).to be_invalid
    end

    it "requires a provider" do
      twitter_identity.provider = nil
      expect(twitter_identity).to be_invalid
    end

    it "requires a user_id" do
      twitter_identity.user_id = nil
      expect(twitter_identity).to be_invalid
    end
  end
end
