require 'vimeo'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  def correct_user
    user = User.find(params[:id])
    unless user == current_user
      flash[:error] = "You do not have permission to access that page."
      redirect_to(root_path)
    end
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? nil : user.id
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in to view this section."
      redirect_to root_path
    end
  end

  def update_feed
    unless current_user.handles.empty?
      current_user.handles.each do |handle|
        response = []

        if handle.provider == "twitter"
          response += $twitter.user_timeline(handle.uri).take(5)
        elsif handle.provider == "vimeo"
          response += Vimeo::Video.get_user_videos(handle.uri)
        end

        tracked = Medium.pluck(:uri)

        response.each do |medium|
          unless tracked.include?(medium.uri.to_s)
            if medium.class == Twitter::Tweet
              new_tweet = Medium.create_tweet_medium(medium)
              new_tweet.update(handle_id: handle.id)
            elsif medium.class == Vimeo::Video
              Medium.create(uri: medium.uri, embed: medium.embed, posted_at: medium.posted_at, handle_id: handle.id)
            end
          end
        end
      end
    end
  end
end
