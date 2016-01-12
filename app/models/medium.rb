class Medium < ActiveRecord::Base
  belongs_to :handle
  validates :uri, :handle_uri, :posted_at, presence: true

  def self.create_medium(tweet_instance)
    # tweet_instance will come from twitter gem (ex: calling $twitter.status(27558893223),
    # which returns an instance of their twitter::tweet class)

    medium = Medium.new
    medium.handle_id = (Handle.find_by uri: tweet_instance.user.uri.to_s).id
    medium.uri = tweet_instance.uri.to_s
    # medium.embed = tweet_instance.uri.to_s
    medium.posted_at = tweet_instance.created_at
    medium.save
    medium.set_embed(tweet_instance)
  end

  def set_embed(tweet_instance)
    response = HTTParty.get("https://api.twitter.com/1/statuses/oembed.json?url=https://twitter.com/Interior/status/#{tweet_instance.id}")
    unescaped = response["html"].delete('\"')
    self.embed = unescaped.delete("\n")
    self.save
  end
end
