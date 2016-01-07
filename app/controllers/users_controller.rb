class UsersController < ApplicationController
  before_action :correct_user, only: :show
  
  def show
    @user = User.find(params[:id])
  end
end
