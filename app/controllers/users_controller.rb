class UsersController < ApplicationController
  before_action :require_login
  before_action :correct_user, only: :show

  def show
    @user = User.find(params[:id])
    @vimeo_handles = @user.find_vimeo_handles
  end
end
