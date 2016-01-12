class Medium < ActiveRecord::Base
  belongs_to :handle
  validates :handle_id, :uri, :embed, :posted_at, presence: true

  def self.create_medium(tweet_instance)
    # tweet_instance will come from twitter gem (ex: calling $twitter.status(27558893223),
    # which returns an instance of their twitter::tweet class)

    medium = Medium.new
    medium.handle_id = (Handle.find_by twitter_id: tweet_instance.user.id).id
    medium.uri = tweet_instance.uri.to_s
    medium.embed = tweet_instance.uri.to_s
    medium.posted_at = tweet_instance.created_at
    medium.save
  end
end
