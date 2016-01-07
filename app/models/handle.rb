class Handle < ActiveRecord::Base
  has_many :media
  has_and_belongs_to_many :users

  def self.search(query)
  end

  def self.fetch_user(user)
    @user = $twitter.user(user)
  end

  def self.create(hash)
    # not sure whre hash will come from
    # in the omniauth ex from class, auth = request.env['omniauth.auth'],
    # which is sent from the sessions#create

    handle = Handle.new
    handle.name = hash["name"]
    handle.description = hash["description"]
    handle.uri = hash["uri"]
    handle.profile_image_uri = hash["profile_image_uri"]
    handle.save
  end
end
