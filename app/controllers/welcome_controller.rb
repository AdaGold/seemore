class WelcomeController < ApplicationController
  def index
    if current_user
      media = current_user.media.order(posted_at: :desc)
      @media = media[0...15]
    end
  end
end
