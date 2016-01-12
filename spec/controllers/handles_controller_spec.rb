require 'rails_helper'

RSpec.describe HandlesController, type: :controller do
  let(:twitter_handle) { create(:twitter_handle) }
  describe "#subscribe" do
    context "when handle already exists in our database" do
      # it "does not create a new handle object" do
      #   handle = create(:handle)
      #   post :subscribe, provider: "vimeo", handle_uri: handle.uri
      #
      # end
    end

    context "when handle does not yet exist in our database" do
      context "when provider is twitter" do
        # post :subscribe, provider: "twitter", handle_uri: handle.uri

      end

      context "when provider is vimeo" do

      end
    end

    context "when user has already subscribed to handle" do

    end

    context "when user has not previously subscribed to handle" do

    end
  end
end
