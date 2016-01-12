require 'vimeo'

class HandlesController < ApplicationController
  before_action :require_login

  def show
    @handle = Handle.find(params[:id])
  end

  def add

  end

  def subscribe
    # params coming from the search result page
    handle_uri = params["handle_uri"]
    provider = params["provider"]

    # see if we have this Handle already in our db
    handle = Handle.find_by(uri: handle_uri)

    if handle.nil? # not in our db
      # conditional based on provider
      if provider == "twitter"
        handle = Handle.create_twitter_handle(handle_uri)
      elsif provider == "vimeo"
        handle = Handle.create_vimeo_handle(handle_uri)
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

  # need to update this
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
    name = params[:query]

    @vimeo_search_results = Vimeo::User.find_by_name(name)
    @vimeo_search_results.each do |sr|
      handle = Handle.find_by_uri(sr.uri)
      if current_user.handles.include?(handle)
        sr.subscribed = true
      end
    end
    @twitter_search_results = $twitter.user_search(name)
  end

  # def search_vimeo
  #   name = params[:query]
  #
  #   @search_results = Vimeo::User.find_by_name(name)
  #   @search_results.each do |sr|
  #     handle = Handle.find_by_uri(sr.uri)
  #     if current_user.handles.include?(handle)
  #       sr.subscribed = true
  #     end
  #   end
  # end
end
