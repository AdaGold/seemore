require 'rails_helper'

RSpec.describe HandlesController, type: :controller do
  let(:handle) do
    Handle.create(name: "example", twitter_id: 1, uri: "link")
  end
  let(:user) do
    User.create(name: "test user")
  end

  describe "GET 'show'" do
    context "when logged in" do
      it "renders the show page" do
        session[:user_id] = user.id
        get :show, id: handle.id
        expect(subject).to render_template :show
      end
    end
  end
end
