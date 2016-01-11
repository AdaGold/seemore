class WelcomeController < ApplicationController
  def index
    @media = current_user.media.order(tweet_time: :desc) if current_user
  end
end
