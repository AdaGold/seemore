class WelcomeController < ApplicationController
  def index
    @media = Media.find_by
  end
end
