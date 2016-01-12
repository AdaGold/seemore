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
    current_user.handles.each do |handle|
      response = Vimeo::Video.get_user_videos(handle.uri) if handle.provider == "vimeo"
      vimeo_media = Medium.all
      tracked = Array.new
      untracked = Array.new

      unless vimeo_media.empty?
        vimeo_media.each do |medium|
          tracked << medium.uri
        end
      end

      response.each do |medium|
        Medium.create(uri: medium.uri, embed: medium.embed, posted_at: medium.posted_at, handle_id: handle.id) unless tracked.include?(medium.uri)
      end
    end
  end
end
