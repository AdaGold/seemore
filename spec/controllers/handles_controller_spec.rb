require 'rails_helper'

RSpec.describe HandlesController, type: :controller do
  # let(:vimeo_handle) { create(:vimeo_handle) }
  let(:user1) { create(:user1) }
  describe "#subscribe" do
    let(:twitter_params) do
      { "provider" => "twitter", "handle_uri" => "https://twitter.com/sferik", "handle_username" => "houglande" }
    end

    let(:vimeo_params) do
      { "provider" => "vimeo", "handle_uri" => "/users/253450" }
    end

    context "when handle already exists in our database" do

    end

    context "when handle does not yet exist in our database" do
      context "when provider is twitter" do
        it "creates a new handle with twitter as provider and 5 media" do
          session[:user_id] = user1.id
          post :subscribe, twitter_params

          expect(Handle.all.last.provider).to eq "twitter"
          expect(Medium.all.length).to eq 5
        end
      end

      context "when provider is vimeo" do
        it "creates a new handle with twitter as provider and 5 media" do
          session[:user_id] = user1.id
          post :subscribe, vimeo_params

          expect(Handle.all.last.provider).to eq "vimeo"
          expect(Medium.all.length).to eq 5
        end
      end
    end

    context "when user has already subscribed to handle" do

    end

    context "when user has not previously subscribed to handle" do

    end
  end
end
