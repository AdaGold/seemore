require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:identity) {
    Identity.new(
    uid: "1234",
    provider: "twitter",
    user_id: "1"
    )
  }

  let (:omniauth_identity) {
    Identity.create_with_omniauth(OmniAuth.config.mock_auth[:twitter])
  }

  describe "validations" do
    it "is valid" do
      expect(identity).to be_valid
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

  describe ".find_with_omniauth" do
    it "returns the identity if one exists" do
      identity = Identity.find_with_omniauth( { "uid" => omniauth_identity.uid,  "provider" => omniauth_identity.provider} )
      expect(identity).to_not be_nil
    end

    context "when it's invalid" do
      it "returns nil" do
        identity = Identity.find_with_omniauth( { "uid" => "123", "provider" => "twitter" } )
        expect(identity).to be_nil
      end
    end
  end

  describe ".create_with_omniauth" do
    it "creates a valid identity" do
      expect(omniauth_identity).to be_valid
    end
  end
end
