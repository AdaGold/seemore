require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:identity) {
    Identity.new(
    uid: "1234",
    provider: "twitter",
    user_id: "1"
    )
  }

  describe "validations" do
    it "is valid" do
      expect(identity).to be_valid
      # expect(vimeo_identity).to be_valid
    end

    it "requires a uid" do
      identity.uid = nil
      expect(identity).to be_invalid
    end

    it "requires a provider" do
      identity.provider = nil
      expect(identity).to be_invalid
    end
  end

  describe ".initialize_from_omniauth" do
    let(:identity) { Identity.create_with_omniauth(OmniAuth.config.mock_auth[:twitter]) }

    it "creates a valid identity" do
      expect(identity).to be_valid
    end
  end
end
