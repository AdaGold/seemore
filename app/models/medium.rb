class Medium < ActiveRecord::Base
  belongs_to :handle
  validates :providor, :handle_id, :uri, :embed, :posted_at, presence: true

  def self.create_medium(tweet_instance)
    # tweet_instance will come from twitter gem (ex: calling $twitter.status(27558893223),
    # which returns an instance of their twitter::tweet class)

    medium = Medium.new
    medium.text = tweet_instance.text
    medium.uri = tweet_instance.uri.to_s
    medium.handle_id = (Handle.find_by twitter_id: tweet_instance.user.id).id
    medium.type = "twitter"
    medium.tweet_time = tweet_instance.created_at
    medium.save
  end


end
