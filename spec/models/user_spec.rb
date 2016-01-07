require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.new(
    name: "Ada"
    )
  }

  describe "validations" do
    it "is valid" do
      expect(user).to be_valid
    end

    it "requires a name" do
      user.name = nil
      expect(user).to be_invalid
    end
  end

  describe ".create_with_omniauth" do
    it "creates a valid user" do
      user = User.create_with_omniauth(OmniAuth.config.mock_auth[:vimeo]["info"])
      expect(user).to be_valid
    end
  end
end
