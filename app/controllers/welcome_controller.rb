class WelcomeController < ApplicationController
  def index
    @media = current_user.media if current_user
  end
end
