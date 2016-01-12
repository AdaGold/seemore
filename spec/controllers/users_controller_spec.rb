require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    it "redirects to root_path if user does not have permissions" do
      user1 = create(:user1)
      user2 = create(:user2)
      session[:user_id] = user1
      get :show, id: user2.id
      expect(response).to redirect_to root_path
    end
  end
end
