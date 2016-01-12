class Handle < ActiveRecord::Base
  has_many :media
  has_and_belongs_to_many :users
  validates :name, :uri, :providor, presence: true

  def self.search(query)
    @results = $twitter.user_search(query)
  end

  def self.create_handle(twitter_user_instance)
    # twitter_user_instance will come from twitter gem (ex: calling $twitter.user("houglande"),
    # which returns an instance of their twitter::user class)

    handle = Handle.new
    handle.name = twitter_user_instance.name
    handle.description = twitter_user_instance.description
    handle.uri = twitter_user_instance.uri
    handle.profile_image_uri = twitter_user_instance.profile_image_uri
    handle.twitter_id = twitter_user_instance.id
    handle.save
  end

  def self.create_vimeo_handle(uri)
    user = Vimeo::User.find_by_uri(uri)
    Handle.create(
      name: user.name,
      uri: user.uri,
      provider: "vimeo"
    )
  end
end
