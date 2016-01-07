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
end
