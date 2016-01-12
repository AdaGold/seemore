class UsersController < ApplicationController
  before_action :correct_user, only: :show
  before_action :require_login

  def show
    @user = User.find(params[:id])
    @vimeo_handles = @user.find_vimeo_handles
  end
end
