class Handle < ActiveRecord::Base
  has_many :media
  has_and_belongs_to_many :users

  def self.search(query)
  end

  def self.fetch_user(user)
    @user = $twitter.user(user)
  end

  def self.create_handle(twitter_user_instance)
    # not sure whre hash will come from
    # in the omniauth ex from class, auth = request.env['omniauth.auth'],
    # which is sent from the sessions#create

    # this will come from twitter gem???

    handle = Handle.new
    handle.name = twitter_user_instance.name
    handle.description = twitter_user_instance.description
    handle.uri = twitter_user_instance.uri
    handle.profile_image_uri = twitter_user_instance.profile_image_uri
    handle.twitter_id = twitter_user_instance.id
    handle.save
  end
end
