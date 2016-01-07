class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']

    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    # CURRENTLY, all this is linking the identity to the user, not linking any feeds or follower handles
    if signed_in?
      if @identity.user == current_user
        # this shouldn't happen unless we add a button to a logged in user allowing them to link the other account (link is not linking a feed, it's creating another identity for the user)
        redirect_to root_path, notice: "Already linked that account!"
      else
        # Linking an identity with the signed in user.  Identity hasn't previously been linked with user.
        # need to add code to stop before changing the identity's user; we want to give the user the option to merge accounts so the two identities point to the same user (one user gets deleted), but we want to make sure the user is ok and understands this first. See Daphne's drawing.
        @identity.user = current_user
        @identity.save
        redirect_to root_path, notice: "Successfully linked that account!"
      end
    else
      # not signed in
      if @identity.user.present?
        # user has signed in to site before, our application can find the identity and it is already associated with a user in our database.
        #this sets the session
        current_user = @identity.user
        redirect_to root_path, notice: "Signed in!"
      else
        # user has not signed in to the site with either account (twitter or vimeo); it's a completely new user.
        @user = User.create_with_omniauth(auth["info"])
        @identity.user = @user
        @identity.save
        current_user = @identity.user
        redirect_to root_path, notice: "Signed in!"
      end
    end
  end

  def destroy
    current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
