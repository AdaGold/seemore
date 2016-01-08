require 'rails_helper'
require 'pry'

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
          it "redirects to home page" do
            get :create, provider: :twitter
            request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:vimeo]
            get :create, provider: :vimeo
            expect(response).to redirect_to root_path
          end
        end
      end
      context "user wasn't logged in" do
        context "is logging in with a previously used identity" do
          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
          it "redirects to home page" do
            get :create, provider: :twitter
            delete :destroy
            get :create, provider: :twitter
            expect(response).to redirect_to root_path
          end
        end
        context "is logging in with a new identity" do

          before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
          it "redirects to home page" do
            User.destroy_all
            get :create, provider: :twitter
            expect(response).to redirect_to root_path
          end
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
