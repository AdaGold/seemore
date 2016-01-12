require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user1) { create(:user1) }

  describe "#index" do
    it "renders the index view" do
      session[:user_id] = user1.id
      get :index
      expect(response).to render_template :index
    end
  end
end
