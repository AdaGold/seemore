class WelcomeController < ApplicationController
  def index
    if current_user
      media = current_user.media.order(posted_at: :desc)
      @media = media[0...15]
    end
  end

  def filter
    filter = params[:filter]

    if filter == "twitter"
      # current_user.media
      # @media = current_user.
      render :index
    elsif filter == "vimeo"
      render :index
    else
      redirect_to root_path
    end
  end
end
