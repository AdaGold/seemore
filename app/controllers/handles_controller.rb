require 'vimeo'

class HandlesController < ApplicationController
  def show
    @handle = Handle.find(params[:id])
  end

  def add

  end

  def subscribe
    handle_uri = params["handle_uri"]
    handle = Handle.find_by_uri(handle_uri)
    if handle.nil?
      handle = Handle.create_vimeo_handle(handle_uri)
      # retrieves 5 most recent posts
      media = handle.media.order(tweet_time: :desc).limit(5)
      # they shouldn't be in the database anyway if the Handle is new, but just in case?
      media.each do |medium|
        medium.save if Medium.find_by(uri: medium.uri).empty?
      end
    end
    if current_user.handles.include?(handle)
      flash[:error] = "Already subscribed!"
      redirect_to :back
    else
      current_user.handles << handle
      flash[:success] = "Subscription added!"
      redirect_to user_path(current_user)
    end
  end

  def unsubscribe
    handle_uri = params["handle_uri"]
    handle = Handle.find_by_uri(handle_uri)
    current_user.handles.delete(handle)
    current_user.save
    if handle.users.empty?
      Handle.destroy(handle.id)
    end
    flash[:success] = "Unsubscribed!"
    redirect_to user_path(current_user)
  end

  def remove

  end

  def search
    Handle.search(query)
  end

  def search_vimeo
    name = params[:query]

    @search_results = Vimeo::User.find_by_name(name)
    @search_results.each do |sr|
      handle = Handle.find_by_uri(sr.uri)
      if current_user.handles.include?(handle)
        sr.subscribed = true
      end
    end
  end
end
