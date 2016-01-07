require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:twitter_identity) {
    Identity.new(
    uid: "1234",
    provider: "twitter",
    user_id: "1"
    )
  }

  let(:vimeo_identity) {
    Identity.new(
    uid: "1234",
    provider: "vimeo",
    user_id: "1"
    )
  }

  describe "validations" do
    it "is valid" do
      expect(twitter_identity).to be_valid
      expect(vimeo_identity).to be_valid
    end
  end
end
