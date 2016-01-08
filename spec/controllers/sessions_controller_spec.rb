require 'rails_helper'

RSpec.describe SessionsController, type: :controller  do
  describe "GET #create" do
    context "when using twitter authorization" do

      context "user was already logged in" do
        context "user tries to log in with same provider" do
          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
          it "redirects to home page" do
            get :create, provider: :twitter
            get :create, provider: :twitter
            expect(response).to redirect_to root_path
          end
        end
        context "user links with a second provider" do
          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:vimeo] }
          it "redirects to home page" do
            get :create, provider: :twitter
            get :create, provider: :vimeo
            expect(response).to redirect_to root_path
          end
        end
      end

      context "user wasn't logged in" do
        context "is a completely new user" do
          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
          it "redirects to home page" do
            get :create, provider: :twitter
            expect(response).to redirect_to root_path
          end
        end
        context "user logs in with a previously used account" do
          
        end
      end
    end
  end
  describe "DELETE #destroy" do
    context "user logs out" do
      it "redirects to home page" do
        delete :destroy
        expect(subject).to redirect_to root_path
      end
    end
  end
end
