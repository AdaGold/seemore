class HandlesController < ApplicationController
  def show
    @handle = Handle.find(params[:id])
  end

  def add

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
