require 'rails_helper'

RSpec.describe Handle, type: :model do
  describe ".validates" do
    context "when created with good parameters" do
      it "will be valid" do
        expect(Handle.new(name: "example", twitter_id: 1, uri: "link")).to be_valid
      end
    end

    # context "when created with any bad parameters" do
    #   it "will not be valid" do
    #
    #   end
    #   it "will not save to database" do
    #
    #   end
    # end
  end
end
