require 'rails_helper'

RSpec.describe HandlesController, type: :controller do
  let(:handle) { create(:handle) }
  let(:user1) { create(:user1) }

  describe "GET 'show'" do
    context "when logged in" do
      it "renders the show page" do
        session[:user_id] = user1.id
        get :show, id: handle.id
        expect(subject).to render_template :show
      end
    end
  end
end
