class MediaController < ApplicationController
  def testing
  end

  def find_user
    @user = $twitter.user("houglande")
  end
end
