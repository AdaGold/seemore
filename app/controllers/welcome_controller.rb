class WelcomeController < ApplicationController
  def index
    if current_user
      media = current_user.media.order(posted_at: :desc)
      @media = media[0...15]
    end
  end

  def filter
    if current_user.media.length < 1
      redirect_to root_path
    else
      filter = params[:filter]

      media = []

      current_user.media.each do |medium|
        if medium.handle.provider == filter
          media << medium
        end
      end

      media = media.order(posted_at: :desc)

      @media = media[0...15]

      render :index
    end
  end
  
end
