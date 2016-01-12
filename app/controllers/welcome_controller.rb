class WelcomeController < ApplicationController
  def index
    @media = current_user.media.order(posted_at: :desc) if current_user
  end
end
