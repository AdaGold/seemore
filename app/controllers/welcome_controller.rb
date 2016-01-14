class WelcomeController < ApplicationController
  def index
    if current_user
      media = Medium.sorted_media(current_user)

      # media = current_user.media.sort_by_posted_at
      # @media = media[0...15]
      @media = media.paginate(:page => params[:page], :per_page => 15)
    end
  end

  def filter
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
