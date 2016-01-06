class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']

    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
      @user = User.create_with_omniauth(auth["info"])
      @user.identity << @identity
    else
      @user = @identity.user
    end

    redirect_to root_path

  end
end
