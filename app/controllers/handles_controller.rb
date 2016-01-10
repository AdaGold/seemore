require 'vimeo'

class HandlesController < ApplicationController
  def show
    @handle = Handle.find(params[:id])
  end

  def add

  end

  def subscribe
    flash[:success] = "Subscription added!"
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
  end
end
