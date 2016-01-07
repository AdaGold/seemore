class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']

    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        redirect_to root_path, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_path, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_path, notice: "Signed in!"
      else
        @user = User.create_with_omniauth(auth["info"])
        @identity.user = @user
        @identity.save
        self.current_user = @identity.user
        redirect_to root_path, notice: "Signed in!"
      end
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
